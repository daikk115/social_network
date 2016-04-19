@extends('base-template')

<?php

$notifications = array( array('link'=>'12345', 'user_name_1'=>'Đặng Văn Đại', 'atc'=>'đã đăng vào nhóm', 'user_name_2'=>'CNTT&TT k57', 'time'=>'một giờ trước'),
    array('link'=>'12345', 'user_name_1'=>'Dương Văn Lực', 'atc'=>'đã like hình ảnh', 'user_name_2'=>'Đặng Văn Đại', 'time'=>'một giờ trước'),
    array('link'=>'12345', 'user_name_1'=>'Phùng thế Hoàng', 'atc'=>'đã đăng vào nhóm', 'user_name_2'=>'CNTT&TT k57', 'time'=>'một giờ trước'),
    array('link'=>'12345', 'user_name_1'=>'Trần Đức Sang', 'atc'=>'đã đăng vào nhóm', 'user_name_2'=>'CNTT&TT k57', 'time'=>'một giờ trước'));

?>
    @section('user-name')
    {{$info_user['user_name']}}
    @stop
    @section('profile-picture')
    {{$info_user['profile_picture']}}
    @endsection
    @section('brithday')
    {{$info_user['brithday']}}
    @endsection
    @section('address')
    {{$info_user['address']}}
    @endsection
    @section('job')
    {{$info_user['job']}}
    @endsection

    @section('personal')
    <img src="{{URL::asset('images/venice.jpg')}}" alt="logo" class="img-rounded img-responsive"><br><div role="tabpanel">
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
    </ul><br>
    <div class="tab-content">

        <div role="tabpanel" class="tab-pane active" id="home">

            @if(sizeof($list_post) > 0)
            @foreach($list_post as $post)
            <div class="panel panel-default">
                <div class="panel-heading">
                 <img src="@yield('profile-picture')" alt="logo" class="img-rounded img-responsive" style="width: 30px; height: 30px; float:left; margin:-5px 5px 0 -8px ">
                    <b><a href="{{URL::asset("users/".$post->user_id)}}">{{$post->user_name}}</a></b>
                    <span class="pull-right"><i class="fa fa-clock-o"></i> {{$post->updated_at}}</span>
                </div>
                        <div class="panel-body"><!-- 
                           <img src="{{URL::asset('images/venice.jpg')}}" alt="logo" class="img-rounded img-responsive"> -->
                           {{$post->content}}</br></br>
                       </div>

                       <div class="panel-footer">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="{{URL::asset("likes/".$post->post_id)}}">
                                    <i class="fa fa-thumbs-up"></i> {{sizeof($post->list_like)}}
                                    <?php $check = 0 ?>
                                    @for($i = 0; $i < sizeof($post->list_like) ; $i++)
                                        @if(Session::get('user_id') ==  $post->list_like[$i]->user_id)
                                            <?php $check  = 1 ?>
                                        @endif
                                    @endfor
                                    @if($check == 1)
                                     Bỏ Thích
                                    @else
                                     Thích
                                    @endif
                                    
                                </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="" onclick="document.getElementById('{{$post->post_id}}').focus(); return false;" ><i class="fa fa-pencil"></i> {{sizeof($post->comment)}} Bình luận</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href=""><i class="fa fa-share"></i> Chia sẻ</a>
                                <a href="#" class="pull-right">Xem thêm bình luận</a>
                            </li>

                            @if(sizeof($post->comment) > 0)
                            @for($i=0; $i < sizeof($post->comment) ; $i++)
                            <li class="list-group-item"><b>
                            <img src="{{User::select('profile_picture')->where('user_id', '=',$post->comment[$i]->user_id)->get()[0]->profile_picture}}" alt="logo" class="img-rounded img-responsive" style="width: 30px; height: 30px; float:left; margin:-5px 5px 0 -8px ">
                            <a href="{{URL::asset("users/".$post->comment[$i]->user_id)}}">{{User::select('user_name')->where('user_id', '=',$post->comment[$i]->user_id)->get()[0]->user_name}}</a></b> {{$post->comment[$i]->content}}</li>
                            @endfor
                            @endif
                            <li class="list-group-item">
                                <form method="post" action={{Asset('comment')}}>
                                    <div class="input-group">
                                        <input type="text" name = "post_id" class="sr-only" value = "{{$post->post_id}}">
                                        <input type="text" name = "user_id" class="sr-only" value = "{{$info_user['user_id']}}">
                                        <input type="text" name = "content" class="form-control input-sm" placeholder="Comment">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary btn-sm" id="btn-send">Send</button>
                                        </span>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>

                @endforeach
                @endif
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <table class="table table-bordered table-striped"><tbody>
                    <tr>
                        <td>Họ và tên</td>
                        <td>{{$info_user['user_name']}}</td>
                        @if($isMe == 1)
                        <td><button class="btn btn-primary" type="button" data-toggle="modal" data-target=".name">Chỉnh sửa</button></td>
                        @endif
                    </tr>
                    <tr>
                        <td>Ngày Sinh</td>
                        <td>{{$info_user['brithday']}}</td>
                        @if($isMe == 1)
                        <td><button class="btn btn-primary" type="button" data-toggle="modal" data-target=".brithday">Chỉnh sửa</button></td>
                        @endif
                    </tr>
                    <tr>
                        <td>Nơi ở hiện nay</td>
                        <td>{{$info_user['address']}}</td>
                        @if($isMe == 1)
                        <td><button class="btn btn-primary" type="button" data-toggle="modal" data-target=".add">Chỉnh sửa</button></td>
                        @endif
                    </tr>
                    <tr>
                     <td>Công việc</td>
                     <td>{{$info_user['job']}}</td>
                     @if($isMe == 1)
                     <td><button class="btn btn-primary" type="button" data-toggle="modal" data-target=".job">Chỉnh sửa</button></td>
                     @endif
                 </tr>
             </tbody></table>
             <div class="modal fade name" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm"><div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Chỉnh sửa họ tên</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-inline" method="post" action = {{Asset('save_user_name')}}>
                            <div class="form-group">
                                <input type="text" class="form-control" name="name-txt" id="name-txt" placeholder="">
                            </div>
                            <div class="form-group">
                                <input id="name-btn" name="name-btn" type="submit" class="btn btn-primary" value="Sửa">
                            </div>
                        </form>
                    </div>
                </div></div>
            </div>
            <div class="modal fade brithday" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm"><div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Chỉnh sửa ngày sinh</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-inline" method="post" action={{Asset('save_brithday')}}>
                            <div class="form-group">
                                <input type="date" class="form-control" name="brithday-txt" id="brithday-txt" placeholder="">
                            </div>
                            <div class="form-group">
                                <input id="brithday-btn" name="brithday-btn" type="submit" class="btn btn-primary" value="Sửa">
                            </div>
                        </form>
                    </div>
                </div></div>
            </div>
            <div class="modal fade add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm"><div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Chỉnh sửa quê quán</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-inline" method="post" action={{Asset('save_address')}}>
                            <div class="form-group">
                                <input type="text" class="form-control" name="address-txt" id="address-txt" placeholder="">
                            </div>
                            <div class="form-group">
                                <input id="add-btn" name="add-btn" type="submit" class="btn btn-primary" value="Sửa">
                            </div>
                        </form>
                    </div>
                </div></div>
            </div>
            <div class="modal fade job" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm"><div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Chỉnh sửa công việc</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-inline" method="post" action={{Asset('save_job')}}>
                            <div class="form-group">
                                <input type="text" class="form-control" name="job-txt" id="job-txt" placeholder="">
                            </div>
                            <div class="form-group">
                                <input id="job-btn" name="job-btn" type="submit" class="btn btn-primary" value="Sửa">
                            </div>
                        </form>
                    </div>
                </div></div>
            </div>
        </div>
        @if($isMe == 0 && $check == 0)
        <form method="post" action={{Asset("add_friend")}}>
            <input name = "user_id_addfriend" value = "{{$user_id_addfriend}}" class="sr-only">
            <input type="submit" class="btn btn-primary" value="Add friends" style="position: absolute; right: 15px; top: 280px;">
        </form>
        @endif
        
    </div>
</div>
@stop