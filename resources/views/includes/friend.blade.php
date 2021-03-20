<div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                              @include('includes.photoProfile',['classname'=>'avatarFriend','obj_user'=>$one,'ss'=>'ss'])
                               <!--<img src="../image/icons8-male-user-100.png" alt="Avatar" class="avatarFriend">-->
                                <div class="fio">                               
                                <h5 class="card-title">
                                    <a href="{{asset('profile/'.$one->id)}}">
                                    {{($one->accounts) ? $one->accounts->surname : ''}} {{$one->name}}
                                    </a>
                                </h5>
                                <p class="card-text">{{__('menu.buttons.online')}} / {{__('menu.buttons.offline')}}</p>
                                <a href="#" class="btn btn-primary">{{__('menu.buttons.write_message')}}</a>
                                @if($one->isFriend())
                                <a href="{{asset('friend/delete/'.$one->id)}}" class="btn btn-danger">{{__('menu.buttons.unsubscribe')}}</a>
                                @else
                                <a href="{{asset('friend/add/'.$one->id)}}" class="btn btn-primary">{{__('menu.buttons.be_friends')}}</a>
                                @endif
                                </div>
                            </div>
                        </div>
                    </div>