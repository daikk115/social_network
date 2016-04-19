
<div class="panel panel-default">
   
    <div class="panel-heading">
        <b><a href="{{url('users/'.$user_id)}}">{{$user_name}}</a></b>
        <span class="pull-right"><i class="fa fa-clock-o"></i> Vừa xong</span>
    </div>
    <div class="panel-body"><!-- 
       <img src="{{URL::asset('images/venice.jpg')}}" alt="logo" class="img-rounded img-responsive"> -->
       {{$content}}</br></br>
   </div>

   <div class="panel-footer">
       <ul class="list-group">
        <li class="list-group-item">
            <a href=""><i class="fa fa-thumbs-up"></i> 0 Thích
            </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="" onclick="document.getElementById('{{$post_id}}').focus(); return false;" ><i class="fa fa-pencil"></i> 0 Bình luận</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=""><i class="fa fa-share"></i> Chia sẻ</a>
            <a href="#" class="pull-right">Xem thêm bình luận</a>
        </li>
        <li class="list-group-item">
            <div class="input-group">
                <input type="text" name = "content" class="form-control input-sm" placeholder="Comment" id = "{{$post_id}}">
                <span class="input-group-btn">
                    <button class="btn btn-primary btn-sm" id="btn-send">Send</button>
                </span>
            </div>
            
        </li>
    </ul>
</div>
</div>

