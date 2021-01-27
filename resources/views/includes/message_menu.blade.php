<a class="nav-link active" id="v-pills-new_message-tab" href="{{asset('messages')}}" >{{__('menu.buttons.write_message')}}</a>

@foreach($lastMessages as $last)
    <a class="nav-link textlast" id="v-pills-last_message-tab" href="{{asset('message/'.$last->friend_id)}}">{{$last->body}}</a>    
@endforeach