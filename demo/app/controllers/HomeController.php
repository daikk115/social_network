<?php 
	/**
	*  
	*/
	class HomeController extends BaseController
	{
		public function home(){
			$new_messages = Message::checkNewMessage(Session::get('user_id'));
			$friend_requests = Friend::getListRequest(Session::get('user_id'));
			$friends_online = Friend::getListFriend(Session::get('user_id'));
			$posts = Post::getPostTotal(Session::get('user_id'));
			$user = User::where("user_id", "=", Session::get('user_id'))->get();
			$new = Message::checkNewMessage(Session::get('user_id'));
			return View::make('home', array('info_user'=>$user[0], 'list_post'=>$posts, 'new_messages'=>$new_messages, 'friend_requests' =>$friend_requests, 'friends_online'=>$friends_online));
		}
		
	}
?>