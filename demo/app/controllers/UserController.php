<?php 
	/**
	*  
	*/
	class UserController extends BaseController
	{
		/*
	public function postLogin(){
		if(User::check_login(Input::get('email'), Input::get('password'))){
			Session::start();
			return View::make('');
		} else echo "Đăng nhập không thành công";
	}*/
	public function postRegister(){
		$user = new User();
		$user->user_name=Input::get("username");
		$user->password=Input::get("password");
		$user->email=Input::get("email");
		$user->save();
		return View::make('home');
	}
	public function viewUser($user_id){
		$new_messages = Message::checkNewMessage(Session::get('user_id'));
		$friend_requests = Friend::getListRequest(Session::get('user_id'));
		$friends_online = Friend::getListFriend(Session::get('user_id'));
		$user = User::where("user_id", "=", $user_id)->get();
		$check = Friend::checkFriend($user_id);
		$posts = Post::getPost($user_id);
		if ($user_id == Session::get('user_id')) {
			return View::make('personal', array('info_user'=>$user[0], 'list_post'=>$posts,'isMe'=>'1', 'check'=>$check,'user_id_addfriend'=>$user_id,
				'new_messages'=>$new_messages, 'friend_requests' =>$friend_requests, 'friends_online'=>$friends_online));
		}else{
			return View::make('personal', array('info_user'=>$user[0], 'list_post'=>$posts, 'isMe'=>'0','check'=>$check,'user_id_addfriend'=>$user_id,
				'new_messages'=>$new_messages, 'friend_requests' =>$friend_requests,'friends_online'=>$friends_online));
		}

	}
	public function editUsername(){
		$update = array("user_name"=>Input::get("name-txt"));
		$user_id = Session::get('user_id');
		DB::table("user")->where("user_id","=",$user_id)->update($update);
		return Redirect::to("users/$user_id");
	}
	public function editBirthday(){
		$update = array("brithday"=>Input::get("brithday-txt"));
		$user_id = Session::get('user_id');
		DB::table("user")->where("user_id","=",$user_id)->update($update);
		return Redirect::to("users/$user_id");
	}
	public function editAddress(){
		$update = array("address"=>Input::get("address-txt"));
		$user_id = Session::get('user_id');
		DB::table("user")->where("user_id","=",$user_id)->update($update);
		return Redirect::to("users/$user_id");
	}
	public function editJob(){
		$update = array("job"=>Input::get("job-txt"));
		$user_id = Session::get('user_id');
		DB::table("user")->where("user_id","=",$user_id)->update($update);
		return Redirect::to("users/$user_id");
	}

	public function addFriend(){
		$user_id_addfriend = Input::get('user_id_addfriend');
		Friend::addFriend(Session::get('user_id'),$user_id_addfriend);
		return Redirect::to("users/$user_id_addfriend");
	}

	public function confirmFriend($user_id){
		Friend::acceptFriend(Session::get('user_id'), $user_id);
		return Redirect::to("users/$user_id");
	}

	public function deleteFriend($user_id){
		Friend::deleteFriend(Session::get('user_id'), $user_id);
  		return Redirect::to("");;
	}
}
?>