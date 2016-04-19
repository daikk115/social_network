@if(sizeof($list_post) > 0)
     @foreach($list_post as $post)
    <div class="panel panel-default">
        <div class="panel-heading">
            <b>
                <img src="{{$post['user_img']}}" alt="logo" class="img-rounded img-responsive" style="width: 30px; height: 30px; float:left; margin:-5px 5px 0 -8px ">
                <a href="{{URL::asset("users/".$post['user_id'])}}">{{$post['user_name']}}</a></b>
                <span class="pull-right"><i class="fa fa-clock-o"></i> {{$post['updated_at']}}</span>
            </div>
                        <div class="panel-body"><!-- 
                           <img src="{{URL::asset('images/venice.jpg')}}" alt="logo" class="img-rounded img-responsive"> -->
                           {{$post['content']}}</br></br>
                       </div>

                       <div class="panel-footer">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href=""><i class="fa fa-thumbs-up"></i> {{sizeof($post['list_like'])}} Thích</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="" onclick="document.getElementById('{{$post['post_id']}}').focus(); return false;" ><i class="fa fa-pencil"></i> {{sizeof($post['comment'])}} Bình luận</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href=""><i class="fa fa-share"></i> Chia sẻ</a>
                                <a href="#" class="pull-right">Xem thêm bình luận</a>
                            </li>

                            @if(sizeof($post["comment"]) > 0)
                            @for($i=0; $i < sizeof($post['comment']) ; $i++)

                            <li class="list-group-item"><b>
                               <img src="{{User::select('profile_picture')->where('user_id', '=',$post['comment'][$i]['user_id'])->get()[0]->profile_picture}}" alt="logo" class="img-rounded img-responsive" style="width: 30px; height: 30px; float:left; margin:-5px 5px 0 -8px ">
                               <a href="users/{{$post['comment'][$i]['user_id']}}">{{User::select('user_name')->where('user_id', '=',$post['comment'][$i]['user_id'])->get()[0]->user_name}}</a></b> {{$post['comment'][$i]['content']}}</li>
                               @endfor
                               @endif
                               <li class="list-group-item">
                                <form method="post" action={{Asset('comment-home')}}>
                                    <div class="input-group">
                                        <input type="text" name = "post_id" class="sr-only" value = "{{$post['post_id']}}">
    
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