<!DOCTYPE html>
<html lang="vi">
 <head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mạng xã hội</title>
    <link rel=icon href="images/vn.png" sizes="16x16" type="image/png">
    {{ HTML::style('bootstrap-3.3.4-dist/css/bootstrap.min.css'); }}
    {{ HTML::style('bootstrap-3.3.4-dist/css/bootstrap-theme.min.css');}}
    {{ HTML::style('font-awesome-4.3.0/css/font-awesome.min.css'); }}
    <!--<link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.3.0/css/font-awesome.min.css">
        -->
    <style type="text/css">
        body {
            padding-top: 55px;

            background-image: url('http://localhost:7070/demo/bootstrap/images/background1.jpg');
            background-attachment: fixed;
            background-size: 100%;
        }
        i.online {
            color: green;
        }
    </style>
    {{ HTML::script('bootstrap-3.3.4-dist/jquery/jquery-1.11.2.min.js') }}
    <script type="text/javascript">
            $(document).ready(function(){
            $("#btn-post").on('click',function(){

                $.ajax({
                        type: "POST", //"$("#form-data").attr('method')"
                        url: "{{url('post')}}", //""$("#form-data").attr('action')""
                        data: {post_stt:$('#post_stt').val()},//textarea[name="post_stt"]
                        cache: false,
                        success: function(data){
                          
                            $('#post_stt').val('');
                            $("#new-status").prepend(data);//#content là id
                        }
                    }); 

            });
            function loadMessage() {
                
                $.ajax({
                    type: "post", 
                    url: "{{url('get_new_post')}}", 
                    cache: false, success: function(data){
                       //$("#new-status").prepend(data);//#content là id
                    }
                    });
                return false;
            }
            setInterval(function() {loadMessage();}, 1000);
            });

            </script>
</head>
<body>
    <!--<script type="text/javascript" src="bootstrap-3.3.4-dist/jquery/jquery-1.11.2.min.js"></script>-->
    {{ HTML::script('bootstrap-3.3.4-dist/jquery/jquery-1.11.2.min.js') }}
    <!--<script type="text/javascript" src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>-->
     {{ HTML::script('bootstrap-3.3.4-dist/js/bootstrap.min.js') }}
    <nav class="navbar navbar-inverse navbar-fixed-top"><div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{URL::asset('')}}">@yield('name-social-network')</a>
        </div>
        <div class="collapse navbar-collapse" id="menu">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Requests <span class="caret"> @yield('numR')</span></a>
                    <ul class="dropdown-menu" role="menu" style="width: 400px; padding: 5px 10px 5px 10px">
                        
                        @yield('friend-requests')
                        
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Messages <span class="caret">@yield('numM')</span></a>
                    <ul class="dropdown-menu" role="menu">
                        @yield('messages')
                        
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Notifications <span class="caret">@yield('numN')</span></a>
                    <ul class="dropdown-menu" role="menu">
                       @yield('notifications')

                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <div class="btn-group navbar-right">
                <a class="btn btn-primary navbar-btn" href="{{URL::asset('users/'.Session::get('user_id'))}}"><i class="fa fa-user fa-fw"></i>{{User::getName(Session::get('user_id'))}}</a>
                <a class="btn btn-primary dropdown-toggle navbar-btn" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="@yield('link-create-group')">Tạo nhóm</a></li>
                    <li><a href="@yield('link-create-page')">Tạo trang</a></li>
                    <li class="divider"></li>
                    <li><a href="@yield('link-activity-log')">Nhật ký hoạt động</a></li>
                    <li><a href="#">Tùy chọn bảng tin</a></li>
                    <li><a href="@yield('link-setup')">Thiết lập</a></li>
                    <li><a href="@yield('link-logout')">Đăng xuất</a></li>
                    <li class="divider"></li>
                    <li><a href="@yield('link-help')">Trợ giúp</a></li>
                    <li><a href="@yield('link-report')">Báo cáo sự cố</a></li>
                </ul>
            </div>
        </div>
    </div></nav>
    <div class="container-fluid"><div class="row">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <img src="@yield('profile-picture')" alt="logo" class="img-rounded img-responsive" style="width: 200px; height:200px ; margin: 20px 0 0 30px "><br />
                    <p>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp; @yield('user-name')</p>
                    <p>&nbsp;&nbsp;&nbsp;<i class="fa fa-birthday-cake"></i>&nbsp; @yield('brithday')</p>
                    <p>&nbsp;&nbsp;&nbsp;<i class="fa fa-street-view"></i>&nbsp; @yield('address')</p>
                    <p>&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil"></i>&nbsp; @yield('job')</p>
                    <div class="list-group">
                        <a class="list-group-item" href="#"><i class="fa fa-arrows-alt"></i>&nbsp; Activities</a>
                        <a class="list-group-item" href="#"><i class="fa fa-plane"></i>&nbsp; Plans</a>
                        <a class="list-group-item" href="#"><i class="fa fa-group"></i>&nbsp; Group</a>
                        <a class="list-group-item" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp; Profile</a>
                        <a class="list-group-item" href="#"><i class="fa fa-camera-retro"></i>&nbsp; Camera</a>
                        <a class="list-group-item" href="#"><i class="fa fa-photo"></i>&nbsp; Album</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            @yield('new-status')
            <div id="new-status">
            </div>
            @yield('status')
            @yield('messages-personal')
            @yield('personal')
            
        </div>  
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Danh Sách Bạn Bè</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        @yield('friends-online')
                       
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" placeholder="Search friends">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-sm" id="btn-search">Search</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div></div>
</body>
</html>