<?php 
	/**
	* 
	*/
	class Friend extends Eloquent
	{
		public $table = "friend";

		// gửi kết bạn
		public static function addFriend($user_id1, $user_id2){
			$count1 = Friend::where("user_id1","=",$user_id1)->where('user_id2', '=', $user_id2)->count();
			$count2 = Friend::where("user_id1","=",$user_id2)->where('user_id2', '=', $user_id1)->count();
			if($count1 > 0 or $count2 > 0){
				echo "đã là bạn bè";
			}else{
				$friend = new Friend;
				$friend->user_id1 = $user_id1;
				$friend->user_id2 = $user_id2;
				$friend->save();
			}
		}	

// chấp nhận lời mời kết bạn
		public static function acceptFriend($user_id1,$user_id2)
		{

			$query = Friend::where("user_id1","=",$user_id1)->where("user_id2","=",$user_id2)->get()->count();

			if($query >0 )
			{

				$update = array('relationship'=> 1);
				$query = Friend::where("user_id1","=",$user_id1)->where("user_id2","=",$user_id2)->update($update);
				return $query;
			}
			else
			{
				$query = Friend::where("user_id1","=",$user_id2)->where("user_id2","=",$user_id1)->get()->count();
				if($query >0)
				{
					$update = array('relationship'=> 1);
					$query = Friend::where("user_id1","=",$user_id2)->where("user_id2","=",$user_id1)->update($update);
					return $query; // true false
				}
				else
				{
					return false;
				}
			}

		}


//xóa kết bạn
		public static function deleteFriend($user_id1,$user_id2)
		{
			$query = Friend::where("user_id1","=",$user_id1)->where("user_id2","=",$user_id2)->get()->count();
			if($query >0 )
			{
				$query = Friend::where("user_id1","=",$user_id1)->where("user_id2","=",$user_id2)->delete();
				return $query;
			}
			else
			{
				$query = Friend::where("user_id1","=",$user_id2)->where("user_id2","=",$user_id1)->get()->count();
				if($query >0)
				{
					$query = Friend::where("user_id1","=",$user_id2)->where("user_id2","=",$user_id1)->delete();
					return $query;
				}
				else
				{
					return false; // ko xoa dc
				}
			}
		}

		public static function getListRequest($user_id)
		{
			$query = DB::table("list_request")->where("user_id2","=",$user_id)->get();
			$array = array();
			foreach ($query as $key) {
				$array1 = array("user_id" => $key->user_id1,
								"user_name" => $key->user_name);
				$array[] = $array1;
			}
			return $array;
		}
			// lấy danh sách id bạn bè của $id_user.
		public static function getIdFriend($id_user)
		{
			$friend1 = Friend::where("user_id1", "=", $id_user)->where('relationship', '=', '1')->get();
			$friend2 = Friend::where("user_id2", "=", $id_user)->where('relationship', '=', '1')->get();
			$list_friend = array($id_user);

			foreach ($friend1 as $friend) {
				$list_friend[] = $friend->user_id2;
			}
			foreach ($friend2 as $friend) {
				$list_friend[] = $friend->user_id1;
			}
			return $list_friend;
		}
		public static function getListFriend($id_user){
			$list_id_friend = Friend::getIdFriend($id_user);
			$list_friend = array();
			if(sizeof($list_id_friend)>1){
				for($i = 1; $i < sizeof($list_id_friend); $i++){
					$ar = User::where('user_id','=',$list_id_friend[$i])->get();
					$array = array('user_id'=>$list_id_friend[$i],
									'profile_picture'=>$ar[0]->profile_picture,
									'user_name'=>$ar[0]->user_name);
					$list_friend[] = $array;
				}
			}
			return $list_friend;
		}

			public static function likePost($post_id,$user_id)
		{
			$list_like = Post::where("post_id","=",$post_id)->get();

		//  chuyen doi json va array

			foreach ($list_like as $key) {
				$array = json_decode($key->list_like, true);
				if(sizeof($array)>0)
				{
					$count =0;
					for($i = 0; $i<sizeof($array); $i++) {
				# code...

						if($array[$i]["user_id"] == $user_id)
						{
							$count++;
							unset($array[$i]);
							$update= array("list_like" => json_encode($array));
							Post::where("post_id","=",$post_id)->update($update);
							return false;
						}
					}
					if($count == 0)
					{
						$tmp = array('user_id' => $user_id );
						$array[] = $tmp;
						$update= array("list_like" => json_encode($array));
						Post::where("post_id","=",$post_id)->update($update);
						return true;
					}
				}
				else
				{
					$tmp = array('user_id' => $user_id );
					$array[] = $tmp;
					$update= array("list_like" => json_encode($array));
					Post::where("post_id","=",$post_id)->update($update);
					return true;
				}
			}
			
		}
		public static function checkFriend($user_id)
		{
			$check = 0;
			$friend1 = Friend::where("user_id1", "=", Session::get('user_id'))->get();
			$friend2 = Friend::where("user_id2", "=", Session::get('user_id'))->get();
			$list_friend = array();

			foreach ($friend1 as $friend) {
				$list_friend[] = $friend->user_id2;
			}
			foreach ($friend2 as $friend) {
				$list_friend[] = $friend->user_id1;
			}
			foreach ($list_friend as $id) {
				if($id == $user_id){
					$check = 1;
				}
			}
			return $check;
		}
	}
	?>