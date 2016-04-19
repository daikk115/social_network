<?php 

/**
* 
*/
class PostController extends BaseController
{
	public function newPost(){
		$post = new Post();
		$post->user_id = Session::get('user_id');//lấy theo session
		$post->content = Input::get("post_stt");
		$post->save();

		$newIdPost = Post::where("user_id","=", Session::get('user_id'))->get();
		$ipPost = 0;
		foreach ($newIdPost as $key) {
		    # code...
		  	$ipPost = $key->post_id;
		}
		  //load json => mới nhất

		 return Response::json(View::make('new_post',array('content'=>Input::get("post_stt"),
		 								 'user_id'=>Session::get('user_id'), 'user_name'=>Session::get('user_name'),
		 								  'post_id'=>$ipPost))->render());

	}

	public function newCommentUser(){
		Post::addComment(Input::get('post_id'), Session::get('user_id'), Session::get('user_name'), Input::get('content'));
  		return Redirect::to("users/$user_id");
	}
	public function newComment(){
		Post::addComment(Input::get('post_id'), Session::get('user_id'), Session::get('user_name'), Input::get('content'));
  		return Redirect::to("");
	}

	public function likePost($post_id){
		Friend::likePost($post_id, Session::get('user_id'));
    	return Redirect::to("");
	}
}
?>