@extends('layouts.app')
@push('scripts')
<!--<script src="{{asset('/ckeditor_b/ckeditor/ckeditor.js')}}"></script>-->
<!--<script src="{{asset('/ckeditor-n/ckeditor.js')}}"></script>-->
<script src="{{asset('ckeditor-m/ckeditor/ckeditor.js')}}"></script>
<script>
    CKEDITOR.replace('comment');
    
</script>
<script src="{{asset('js/translate.js')}}"></script>
@endpush
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            <div class="card" style="width: 14rem;">
                <img src="../image/icons8-user-100.png" class="card-img-top" alt="Фото пользователя" width="200px">
                <div class="card-body">
                    <h5 class="card-title">Фамилия и имя пользователя</h5>
                    <p class="card-text">{{ __('menu.user_info.position') }}:</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">{{ __('menu.user_info.place_of_work') }}:<a href="#" class="card-link">Кол-во </a></li>
                    <li class="list-group-item">{{__('menu.user_info.friends')}}: <a href="#" class="card-link">Кол-во </a></li>
                    <li class="list-group-item">{{__('menu.user_info.community')}}: <a href="#" class="card-link">Кол-во </a></li>
                    <li class="list-group-item">{{__('menu.user_info.foto')}}: <a href="#" class="card-link">Кол-во </a></li>
                </ul>
                <div class="card-body">
                    <a href="{{asset('profile/'.auth::user()->id)}}" class="card-link">{{__('menu.user_info.open_profile')}}<img src="{{asset(storage_path().setting('admin.loader'))}}"><img src="{{ Storage::disk(config('voyager.storage.disk'))->url(setting('admin.loader')) }}" style="width:200px; height:auto; padding:2px; border:1px solid #ddd; margin-bottom:10px;"></a>
                </div>
            </div>




        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">{{__('menu.news_list.news')}}</div>

                <div class="card-body">


                    <form action="{{asset('publication')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="card-header">
                                <label for="comment">{{__('menu.news_list.what_is_new')}}?</label>
                                <textarea class="form-control" id="comment" name="body" cols="3"></textarea>

                                <input type="submit" name="submit" value="{{__('menu.buttons.save')}}">
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
                            <span>Фамилия Имя</span>&nbsp;&nbsp;<span>{{$one->created_at->format('d/m/Y')}}</span>
                            <span> <select class="custom-select custom-select-sm col-md-4">
                                    <option selected>...</option>
                                    @if($one->user_id==auth::user()->id)
                                    <option value="1"><a class="dropdown-item" href="#">{{__('menu.buttons.change')}}</a></option>
                                    @endif
                                    <option value="1"><a class="dropdown-item" href="#">{{__('menu.buttons.copy_link')}}</a></option>
                                    <option value="2"><a class="dropdown-item" href="#">{{__('menu.buttons.hide_post')}}</a></option>
                                    <option value="3"><a class="dropdown-item" href="#">{{__('menu.buttons.complain')}}</a></option>
                                    <option value="4"><a class="dropdown-item" href="#">{{__('menu.buttons.unsubscribe')}}</a></option>
                                </select>
                            </span>
                        </div>
                        <div class="card-body">
                            <p class="card-text" id="translate-{{$one->id}}">{!!$one->body!!}</p>
                            <a href="#" data-id="{{$one->id}}" class="translate">{{__('menu.buttons.show_translation')}}</a>
                            
                            
                            <br>
                            <a href="#" class="btn btn-primary"><img src="../image/like-16.png">Like</a>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentL">
                              {{__('menu.buttons.comment')}}
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="commentL" tabindex="-1" aria-labelledby="commentLLabel" aria-hidden="true">
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




        <div class="col-md-2">
            <div id="root"></div>
            <div class="card">
              
                <div class="card-header">
                    {{__('menu.recommendations.friend_recommendations')}}
                </div>
                @foreach($users as $user)
                  <div class="card-body">
                    <p class="card-title"><img src="../image/icons8-male-user-100.png" class="card-img-top" alt="Фото"><strong>{{$user -> name}}</strong></p>
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
