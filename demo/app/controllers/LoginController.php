<?php 
	/**
	*  
	*/
	class LoginController extends BaseController
	{
		public function getListOnline($user_id){
			
			$check = Login::where("user_id","=",$user_id)->count();
			if($check>0){
				Login::refesh($user_id);
			}else {
				return false;
			}

		}

		public function login(){
			if(User::check_login(Input::get("email"),Input::get("password"))) {
				Session::start();
				$user = User::get_info(Input::get('email'));
				Session::put("user_id", $user[0]->user_id);
				Session::put("user_name",$user[0]->user_name);
				return Redirect::to('');
			} else {
				$noti = "Không thể đăng nhập. Vui lòng kiểm tra lại !";
				return View::make('login', array('noti'=>$noti));
			};

		}

		public function register(){
			$email = User::select('email')->where('email','=',Input::get("email"))->get();
			foreach ($email as $key) {
				if($key->email == Input::get("email")){
					$noti = "Đăng ký không thành công. Email đã tồn tại";
					return View::make('login', array('noti'=>$noti));
				}}
				
				$user = new User();
				$user->user_name=Input::get("username");
				$user->password=Input::get("password");
				$user->email=Input::get("email");
				$user->save();
				$noti = "Đăng ký thành công. Vui lòng đăng nhập!";
				return View::make('login', array('noti'=>$noti));
			}
		}
		?>