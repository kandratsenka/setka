@if($obj_user->accounts)
            @if($obj_user->accounts->photo_profile)
            @if(!isset($ss))
            @php
            $ss = 's';
            @endphp
            @endif
            <img src="{{asset('uploads/'.$obj_user->id.'/'.$ss.$obj_user->accounts->photo_profile)}}" alt="Avatar"  id="avatar_default" class="{{$classname}}">
            
            @else
            <img src="{{asset('image/avatar/icons8-user-settings-100.png')}}" alt="Avatar" id="changed_avatar" class="{{$classname}}">
            @endif
            @else 
            <img src="{{asset('image/avatar/icons8-user-settings-100.png')}}" alt="Avatar" id="changed_avatar" class="{{$classname}}">
            @endif