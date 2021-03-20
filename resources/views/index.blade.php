@extends('layouts.app')
@push('scripts')
<script src="{{asset('ckeditor5-build-classic/build/ckeditor.js')}}"></script>
<script src="{{asset('ckfinder/ckfinder.js')}}"></script>
<script src="{{asset('js/main.js')}}"></script>

<script>
    /*CKEDITOR.replace('comment',{
        filebrowserUploadUrl:'{{route('upload',['_token'=>csrf_token()])}}',
        filebrowserUploadMethod:'form'
    });*/
    /*https://ckeditor.com/docs/ckfinder/demo/ckfinder3/samples/ckeditor.html*/
    
    ClassicEditor
		.create( document.querySelector( '#comment' ), {
            ckfinder: {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json&userId={{auth::user()->id}}'
                /*uploadUrl: '{{route('upload',['_token'=>csrf_token()])}}'*/
            }
        }  )
		.then( editor => {
			window.editor = editor;
       // console.log(editor.getData());
		} )
		.catch( error => {
			console.error( 'There was a problem initializing the editor.', error );
		} );
    
    function getId(url) {
        if(url.includes('=')){
            var res = url.split('=');
        }else{
            var res = url.split('/');
        }
        return res[res.length-1];
    }
    
    $(function(){
        $('a').each(function (index, value){
          //  console.log($(this).attr('href'));
        });
         $('.media oembed').each(function(i,obj){
           
            var srcI = $(this).attr('url');
            var getUrl = getId(srcI);
            var html = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+ getUrl +'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
            $(this).html(html); 
             //console.log('i = ' + i + 'obj = ' + $(this));
        });
        $('.radio_complain').click(function(){
            
            if($(this).is(':checked')){
                 $('#text_complain').prop('disabled',true);
            }
        });
        $('#exampleRadios4').click(function(){
            
            if($(this).is(':checked')){
                $('#text_complain').prop('disabled',false);
            }
        });
    });
    
    
   
    
</script>
<script src="{{asset('js/translate.js')}}"></script>
@endpush
@section('content')
<div class="container" >
    <div class="row justify-content-center">
        <div class="col-md-3">
            <div class="card" style="width: 16rem;">
                 @include('includes.photoProfile',['classname'=>'card-img-top','obj_user'=>auth::user()])
                <!--<img src="../image/icons8-user-100.png" class="card-img-top" alt="Фото пользователя" width="200px">-->
                <div class="card-body">
                    <h5 class="card-title">{{(auth::user()->accounts) ? auth::user()->accounts->surname : ''}} {{(auth::user()->name) ? auth::user()->name : ''}}</h5>
                    <p class="card-text">{{ __('menu.user_info.position') }}:</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">{{ __('menu.user_info.place_of_work') }}:<a href="#" class="card-link">Кол-во </a></li>
                    <li class="list-group-item">{{__('menu.user_info.friends')}}: <a href="#" class="card-link">Кол-во </a></li>
                    <!--<li class="list-group-item">{{__('menu.user_info.community')}}: <a href="#" class="card-link">Кол-во </a></li>-->
                    <li class="list-group-item">{{__('menu.user_info.foto')}}: <a href="#" class="card-link">Кол-во </a></li>
                </ul>
                <div class="card-body">
                    <a href="{{asset('profile/'.auth::user()->id)}}" class="card-link">{{__('menu.user_info.open_profile')}}</a>
                </div>
            </div>




        </div>
        <div class="col-md-7">
            <div class="card" >
                <div class="card-header">{{__('menu.news_list.news')}}</div>

                <div class="card-body">


                    <form action="{{asset('publication')}}" method="post" enctype="multipart/form-data" >
                        @csrf
                        <div class="form-group">
                            <div class="card-header" >
                               <!--<input type="button" id="ckfinder-popup-1" value="add file">-->
                                <label for="comment">{{__('menu.news_list.what_is_new')}}?</label>
                                <textarea class="form-control sk5" class="comment" id="comment" name="body" cols="3"></textarea>
                                <input type="submit" id="wallpost" name="submit" value="{{__('menu.buttons.save')}}">
                            </div>
                            
                        </div>
                    </form>

                    <!--Сортировка-->
                    <div class="form-group justify-content-between">
                        <p id="sort_news"> {{__('menu.news_list.sort')}}:
                            <a href="?sort=popular" class="popular">{{__('menu.news_list.by_popularity')}}</a>
                            <a href="?sort=new" class="new">{{__('menu.news_list.new')}}</a>
                            <a href="?sort=old" class="old">{{__('menu.news_list.old')}}</a>
                        </p>
                        <br>
                    </div>
                    <!--Стена-->
                    
                        
                    @foreach($objs as $one)
                      
                    <div class="card">
                        <div class="card-header">
                            <span>{{($one->users->accounts) ? $one->users->accounts->surname : ''}} {{($one->users) ? $one->users->name : ''}}</span>&nbsp;&nbsp;<span>{{$one->created_at->format('d/m/Y')}}</span>
                            <!---->
                            <div class="dropdown">
                                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton_{{$one->id}}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Кнопка выпадающего списка
                                  </button>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton_{{$one->id}}">
                                    @if($one->user_id == auth::user()->id)
                                    <a class="dropdown-item" data-toggle="modal" data-target="#change_{{$one->id}}">{{__('menu.buttons.change')}}</a>
                                    @endif                                  
                                    <a class="dropdown-item" data-toggle="modal" data-target="#repost_{{$one->id}}">
                                      Поделиться
                                    </a>
                                    
                                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal_{{$one->id}}">
                                      {{__('menu.buttons.copy_link')}}
                                    </a>
                                    @if($one->user_id != auth::user()->id)
                                    <a class="dropdown-item" href="#">{{__('menu.buttons.hide_post')}}</a>
                                    <a class="dropdown-item" data-toggle="modal" data-target="#complain_{{$one->id}}">{{__('menu.buttons.complain')}}</a>
                                    
                                    <a class="dropdown-item" data-toggle="modal" data-target="#unsubscribe_{{$one->id}}">{{__('menu.buttons.unsubscribe')}}</a>
                                                                    
                                      
                                    @endif
                                  </div>
                                </div>
                             <!--Модальное окно для Изменить-->
                                                                                             
                                <div class="modal fade" id="change_{{$one->id}}" tabindex="-1" aria-labelledby="exampleModalLabel_{{$one->id}}" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel_{{$one->id}}">Modal title</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <a href="{{asset('publication/edit/'.$one->id)}}">Перейти на страницу редактирования записи</a>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                  <!----> 
                            <!-- Модальное окно Поделиться-->
                                    <div class="modal fade" id="repost_{{$one->id}}" tabindex="-1" aria-labelledby="exampleModalLabel_{{$one->id}}" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_{{$one->id}}">{{asset('public/'.$one->id)}} </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>
                                          <div class="modal-body">
                                         
                                           Поделиться в личном сообщении с:
                                           
                                           <div class="dropdown">
                                              <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Ссылка выпадающего списка
                                              </a>

                                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                               @foreach($user_friends as $friend)
                                                <form action="{{asset('/message/'.$friend->id)}}" method="post">
                                                @csrf
                                                <input type="hidden" name="body" value="{{asset('public/'.$one->id)}}">
                                                <button type="submit" class="btn btn-secondary dropdown-item repost_mg_{{$one->id}}" href="#">{{$friend->name}}</button>
                                                </form>
                                               @endforeach 
                                              </div>
                                              
                                              <script>
                                              $(function(){
                                                 $('.repost_mg_{{$one->id}}').click(function(){
                                                     var msg = $('#repost_message_{{$one->id}}');
                                                     console.log(msg);
                                                 }) 
                                              })
                                              </script>
                                            </div>
                                           
                                          </div>
                                         
                                        </div>
                                      </div>
                                    </div>

                                    <!-- Модальное окно Копировать ссылку-->
                                    
                                    <div class="modal fade" id="exampleModal_{{$one->id}}" tabindex="-1" aria-labelledby="exampleModalLabel_{{$one->id}}" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_{{$one->id}}">Заголовок модального окна</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>
                                          <input type="text" class="modal-body" id="myInput_{{$one->id}}" value="{{asset('public/'.$one->id)}}">
                                          <div class="modal-footer">
                                          
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                                            
                                             <button type="button" class="btn btn-primary" onclick="myFunction()">Копировать</button>
                                            
                                                <script>
                                                function myFunction() {
                                                  var copyText = document.getElementById("myInput_{{$one->id}}");
                                                  copyText.select();
                                                  document.execCommand("copy");
                                                }
                                                </script>
                                               
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    
                                   

                                    <!-- Модальное окно для Пожаловаться -->
                                    <div class="modal fade" id="complain_{{$one->id}}" tabindex="-1" aria-labelledby="exampleModalLabel_{{$one->id}}" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_{{$one->id}}">Пожаловаться на <a href="{{asset('public/'.$one->id)}}" target="_blank">{{asset('public/'.$one->id)}}</a></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>
                                          
                                          <form method="post" action="{{asset('/complain')}}" name="complain">
                                          @csrf
                                          <div class="modal-body">
                                            <input type="hidden" name="publication" value="{{$one->id}}">
                                                <div class="form-check">
                                                  <input class="form-check-input radio_complain" type="radio" name="exampleRadios" id="exampleRadios1"  value="spam" checked>
                                                  <label class="form-check-label" for="exampleRadios1">
                                                    Это спам
                                                  </label>
                                                </div>
                                                <div class="form-check">
                                                  <input class="form-check-input radio_complain" type="radio" name="exampleRadios" id="exampleRadios2" value="inappropriate content">
                                                  <label class="form-check-label" for="exampleRadios2">
                                                    Это неуместный контент
                                                  </label>
                                                </div>
                                                <div class="form-check">
                                                  <input class="form-check-input radio_complain" type="radio" name="exampleRadios" id="exampleRadios3" value="It is not interesting to me" >
                                                  <label class="form-check-label" for="exampleRadios3">
                                                    Это мне не интересно
                                                  </label>
                                                </div>
                                            
                                                <div class="form-check">
                                                 <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios4"  value="another" >
                                                  <label class="form-check-label" for="exampleRadios4">
                                                    Другое
                                                  </label>
                                                  <br>
                                                  <textarea id="text_complain" name="text_complain" disabled></textarea>
                                                </div>
                                          </div>
                                          
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Отправить</button>
                                          </div>
                                          </form>
                                        </div>
                                      </div>
                                    </div>

                                   
                                    <!-- Модальное окно для отписаться -->
                                    <div class="modal fade" id="unsubscribe_{{$one->id}}" tabindex="-1" aria-labelledby="exampleModalLabel_{{$one->id}}" aria-hidden="true">
                                      <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_{{$one->id}}">Отписаться</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>
                                          <div class="modal-body">
                                            @include('includes.friend', ['one'=>$one->users])
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                          </div>
                                        </div>
                                      </div>
                                    </div>              
                                                                           
                             
                             </div>
                           
                       
                        
                        
                        <div class="card-body">
                            <p class="card-text" id="translate-{{$one->id}}">{!!$one->body!!}</p>
                            <a href="#" data-id="{{$one->id}}" class="translate">{{__('menu.buttons.show_translation')}}</a>
                            
                            
                            <br>
                            <a href="#" class="btn btn-primary"><img src="../image/like-16.png">Like</a>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentL_{{$one->id}}">
                              {{__('menu.buttons.comment')}}
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="commentL_{{$one->id}}" tabindex="-1" aria-labelledby="commentLLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="commentLLabel">{{__('menu.buttons.comment')}}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            История последних комментариев
                                            <textarea class="form-control" id="commentList" name="body" cols="3"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!---->

                        </div>

                    </div>
                    <br>
                    @endforeach
                    <div id="p">
                        {!!$objs->render()!!}
                    </div>
                </div>

            </div>

        </div>



        <!--Рекомендации-->
        <div class="col-md-2">
           
            <!--Вставка компонента <div id="root"></div>-->
            <div class="card" >
              
                <div class="card-header">
                    {{__('menu.recommendations.friend_recommendations')}}
                </div>
                @foreach($users as $user)
                  <div class="card-body">
                    <p class="card-title">
                    @include('includes.photoProfile',['classname'=>'card-img-top','obj_user'=>$user])
                    <!--<img src="../image/icons8-male-user-100.png" class="card-img-top" alt="Фото">-->
                    <strong>{{($user->accounts) ? $user->accounts->surname : ''}} {{$user -> name}}</strong></p>
                    @if(isset($user->property->born))
                    <p>
                   {{$user -> property -> age}}
                   {{AgeHelper($user -> property -> age)}}
                   <!-- \Lang::choice('года|лет', $count, [], 'ru');-->
                    </p>
                    @endif
                    <p class="card-text">{{__('menu.user_info.position')}}- {{__('menu.user_info.place_of_work')}}</p>
                    <a href="#" class="btn btn-primary">{{__('menu.buttons.add_to_friends_list')}}</a>
                </div>  
                @if(!$loop->last)
                <hr>
                @endif
                
                @endforeach
               
            </div>
            <br>
            <div class="card">
                <div class="card-header">
                    {{__('menu.recommendations.community_recommendations')}}
                </div>
                <div class="card-body">
                    <p class="card-title"><img src="../image/CommunityAvatar.svg" class="card-img-top" alt="Фото"><strong>Название</strong></p>
                    <a href="#" class="btn btn-primary">{{__('menu.buttons.join')}}</a>
                </div>
                <hr>
                <div class="card-body">
                    <p class="card-title"><img src="../image/CommunityAvatar.svg" class="card-img-top" alt="Фото"><strong>Название</strong></p>
                    <a href="#" class="btn btn-primary">{{__('menu.buttons.join')}}</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
