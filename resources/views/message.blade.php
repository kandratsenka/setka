@extends('layouts.app')
@push('scripts')
<script src="{{asset('js/socket.io.js')}}"></script>
<script>
$(document).ready(function(e) {
    var socket = io.connect('http://localhost:3003');
    socket.on('connect', function () {
        socket
            .emit('authenticate', {token: '{{auth('api')->tokenById(auth::user()->id)}}'})
            .on('authenticated',function(){
            console.log('authenticate');
            })
            .on('unauthorized', (msg) => {
                        console.log(msg/*unauthorized: ${JSON.stringify(msg.data)}*/);
                        throw new Error(msg.data.type);
                    });
        
       /* console.log('connected');*/
    });
    
    socket.on('row{{$id}}', function (rows) {
                console.log(rows);
                var html = rows[0];
                connectionUpdate(html);
            });
    
   // socket.on('echo', function (rows) {
       // var html = JSON.stringify(rows);
      //  console.log(rows[0]);
       // $.each(html, function(index, element) {
       // $('#display').append(element.body);
       // });
       // $('#display').append('<div>'+rows[0].body+'</div>');
        //document.getElementById("display").innerHTML = html;
        //console.log(rows);
  //  });
  
    
  
});
 function connectionUpdate(obj){
     console.log(obj);
     $('#display').append('<div>'+obj.body+' | '+ obj.created_at + '</div>');
     
 }
    
    
    
</script>

@endpush
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-3">
            @include('includes.message_menu')
        </div>
        <div class="card col-md-9">

            <div class="container">
                
                   <div class="card-body">
                   <form method="post" action="{{asset('message/'.$id)}}">
                     @csrf
                     <input type="text" placeholder="{{__('menu.messages_page.write_something')}}" name="body" required/>
                    <input type="submit" value="Отправить" class="btn btn-primary" /> 
                    </form>
                    </div>
                 <div id="display"> </div>
                 @foreach($objs as $one)
                 <div class="row">
                     <div class="col-md-6 {{(Auth::user()->id == $one->resiver_id)?'resiver ':'sender offset-md-4'}}">
                     {{$one->body}}
                     <time class="m_time mt-3 position-relative">{{\Carbon\Carbon::parse($one->created_at)->format('H:i')}}</time>
                     </div>
                     
                 </div>
                 <br style="clear:both;" />
                 @endforeach
                </div>
            </div>

        </div>
    

</div>
@endsection

    
   