<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

///////// ROUTE LOGIN

Route::filter('checkLogin', function(){
 if(!Session::has('user_name')){
  $noti = "";
   return View::make('login', array('noti'=>$noti));
 } else{

 }
});

/*Route::post('login', function(){
  if(User::check_login(Input::get("email"),Input::get("password"))) {
    Session::start();
    $user = User::get_info(Input::get('email'));
    Session::put("user_id", $user[0]->user_id);
    Session::put("user_name",$user[0]->user_name);
  //Session::regenerate();
    return Redirect::to('');
  } else {
      $noti = "Không thể đăng nhập. Vui lòng kiểm tra lại !";
      return View::make('login', array('noti'=>$noti));
  };

});*/
Route::post('login', 'LoginController@login');

Route::post('register', 'LoginController@register');

////////////////////////// Nhóm tất cả những đường link cần check qua đã login chưa
////////////////////////// 

Route::group(array('before' => 'checkLogin'), function(){
   Route::get('messages/{user_id}', array('uses'=>'MessagesController@getMessages'));

   Route::get('', 'HomeController@home');

   //tạm thời đổi thành get logout để nhấn vào đăng xuất thì nó thoát
    Route::get('logout', function(){
      Session::flush();
      return Redirect::to('');
    });

    Route::get('/users/{user_id}', 'UserController@viewUser');


});



////////////////// LỰC GỬI

//post bai. luu vao Post
Route::post('post', 'PostController@newPost');

// lấy bài đăng mới của bạn bẻ cho lên trang chủ, lấy cố định
Route::post('get_new_post', function(){
      $new_post = Post::getNewPost("2015-05-11 09:09:2");
      return Response::json(View::make('new_post_friends',array('list_post'=>$new_post))->render());
      
});
//comment vào trang cá nhân
Route::post('comment', 'PostController@newCommentUser');
// coment lên trang chủ
Route::post('comment-home','PostController@newComment');


//chinh sua thong tin
Route::post('save_user_name', 'UserController@editUsername');
Route::post('save_brithday', 'UserController@editBirthday');

Route::post('save_address', 'UserController@editAddress');

Route::post('save_job', 'UserController@editJob');


//gửi tin nhắn
Route::post('sent_message', 'MessagesController@sentMessage');

//kết bạn
Route::post('add_friend', 'UserController@addFriend');

Route::post('confirm/{user_id}', 'UserController@confirmFriend');
Route::post('delete/{user_id}', 'UserController@deleteFriend');


Route::get( 'likes/{post_id}', 'PostController@likePost');
