<?php 
	/**
	* 
	*/
	class Post extends Eloquent{
		public $table = "post";

		public static function addComment($post_id, $user_id, $user_name, $content)
		{

			$check = Post::where("post_id","=",$post_id)->count();

			if($check>0){
				$result = Post::select('comment')->where('post_id', '=', $post_id)->get();
				$result = $result[0]->comment;
				$result  = json_decode($result, true);
				$new_comment = array('user_id'=>$user_id, 'user_name'=>$user_name, 'content'=>$content, 'time'=>date('h:i:s d-m-y'));
				$result[] = $new_comment;
				$result = json_encode($result);
				Post::where('post_id', '=', $post_id)->update(array('comment'=>$result));
			}else{              
				// không làm gì cả
			}
		}


		public static function getPost($user_id)
		{

			$check = Post::where("user_id","=",$user_id)->count();
			if($check>0){
				$result = DB::table('full_post')->where('user_id', '=', $user_id)->get();
				foreach ($result as $object) {
					
					$object->comment =  json_decode($object->comment);
					$object->list_like = json_decode($object->list_like);
				}
				/*echo "<pre>";
					print_r($result);
				echo "</pre>";*/
				return $result;
			}else{
        // không làm gì cả
				return null;
			}
		}
		public static function getPostTotal($user_id){
	 		$post = DB::table('full_post')->get();//tại sao dùng Post::get() lại không được??
	 		// user.user_id, user.user_name, post.updated_at, post.content, post.list_like, post.comment, post.post_id
	 		$list_post = array();
	 		$list_friend = Friend::getIdFriend($user_id);

	 		foreach ($post as $post) {
	 			// với mỗi bài post, check toàn bộ list bạn bè
	 			for($i = 0; $i <sizeof($list_friend); $i++){

	 				// nếu như là bài post của bạn bè
					if($post->user_id == $list_friend[$i]){
						$comment = json_decode($post->comment, true);
						$list_like = json_decode($post->list_like, true);
						$user_img = DB::table("user")->where("user_id", "=", $post->user_id)->get();
						foreach ($user_img as $key) {
						$array = array(	"user_id"=>$post->user_id,
										"user_name" => $post->user_name,
										"user_img"=>$key->profile_picture,
										"updated_at"=>$post->updated_at,
										"content"=>$post->content,
										"list_like"=>$list_like,
										"comment"=>$comment,
										"post_id"=>$post->post_id
										);
						$list_post[] = $array;}
					}
				}
	 		}
	 		return $list_post;
 		}


 		public static function getNewPost($time_post){
 			$post = DB::table('full_post')->where('updated_at', '>=', $time_post)->get();//tại sao dùng Post::get() lại không được??
	 		// user.user_id, user.user_name, post.updated_at, post.content, post.list_like, post.comment, post.post_id
	 		$list_post = array();
	 		$list_friend = Friend::getIdFriend(Session::get('user_id'));

	 		foreach ($post as $post) {
	 			// với mỗi bài post, check toàn bộ list bạn bè
	 			for($i = 0; $i <sizeof($list_friend); $i++){

	 				// nếu như là bài post của bạn bè
					if($post->user_id == $list_friend[$i]){
						$comment = json_decode($post->comment, true);
						$list_like = json_decode($post->list_like, true);
						$user_img = DB::table("user")->where("user_id", "=", $post->user_id)->get();
						foreach ($user_img as $key) {
						$array = array(	"user_id"=>$post->user_id,
										"user_name" => $post->user_name,
										"user_img"=>$key->profile_picture,
										"updated_at"=>$post->updated_at,
										"content"=>$post->content,
										"list_like"=>$list_like,
										"comment"=>$comment,
										"post_id"=>$post->post_id
										);
						$list_post[] = $array;}
					}
				}
	 		}
	 		return $list_post;
 		}
	}
	?>