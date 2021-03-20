@extends('layouts.app')
@push('scripts') 
<script src="{{asset('js/profile.js')}}"></script>
<script src="{{asset('js/cropper.js?time='.time())}}"></script>
<script src="{{asset('js/cropper.main.js')}}"></script>
<script src="{{asset('js/cropper_save.js?time='.time())}}"></script>
@endpush
@section('styles')
@parent()    
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" crossorigin="anonymous">
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('/css/cropper.css')}}">
    <link rel="stylesheet" href="{{asset('/css/cropper.main.css')}}">
@endsection
@section('content')



<div class="container">

    <div class="card " id="foto_profile">
        <div id="bg_profile">
          
           <!-- @include('includes.photoProfile',['classname'=>'bg_profile'])-->
            @if($obj_user->accounts)
            @if($obj_user->accounts->bg_profile)
            <img src="{{asset('uploads/'.$obj_user->id.'/'.$obj_user->accounts->bg_profile)}}" class="card-img-top avatar-top" id="bg" alt="Фон профиля" style="width:100%;">
            @else
            <img src="../image/minimalizm-oblaka-blue.jpg" class="card-img-top avatar-top" id="bg" alt="Фото профиля" >
            @endif
            @endif
            @if(auth::user())
            @if(auth::user()->id == $obj_user->id)
                <div id="bg_showhite">
                   <!--Сменить фон-->
                    <a href="#" data-toggle="modal" data-target="#bgModal"><img src="../image/icons8-camera-48 (1).png" title="Сменить фон"></a>
                </div>
            @endif
            @endif
        </div>
       <div id="foto_name_profile">
          @include('includes.photoProfile',['classname'=>'avatar'])
           <!-- <img src="../image/avatar.jpg" alt="Avatar"  id="avatar" class="avatar">-->
            @if(auth::user())
            @if(auth::user()->id == $obj_user->id)
            <div id="avatar_showhite">
              <!-- Сменить аватар-->
                <a href="#" data-toggle="modal" data-target="#avatarModal">
                <img src="../image/icons8-pencil-32.png" title="Редактировать основные сведения"></a>
            </div>
            @endif
            @endif
        
        <div class="card-body fio" id="fio">
            <h5 class="card-title">{{($obj_user->accounts) ? $obj_user->accounts->surname : ''}} {{($obj_user->name) ? $obj_user->name : ''}}</h5>
            <p class="card-text">{{($obj_user->accounts) ? $obj_user->accounts->status : ''}}</p>
            @if($obj_user->accounts) {{($obj_user->accounts->show_contacts==1) ? $obj_user->accounts->phone : ''}}
            @endif
        </div>
        </div>
    </div>


    <br>
    <div class="card " id="profile_info">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="information-tab" data-toggle="tab" href="#information" role="tab" aria-controls="information" aria-selected="true">{{__('menu.profile_page.information')}}</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="contacts-tab" data-toggle="tab" href="#contacts" role="tab" aria-controls="contacts" aria-selected="false">{{__('menu.profile_page.contacts')}}</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="career-tab" data-toggle="tab" href="#career" role="tab" aria-controls="career" aria-selected="false">{{__('menu.profile_page.career')}}</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="education-tab" data-toggle="tab" href="#education" role="tab" aria-controls="education" aria-selected="false">{{__('menu.profile_page.education')}}</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="education-tab" data-toggle="tab" href="#friends" role="tab" aria-controls="friends" aria-selected="false">{{__('menu.profile_page.friends')}}</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="information" role="tabpanel" aria-labelledby="information-tab">
                <table>
                    <tr>
                        <td>{{__('menu.profile_information.date_of_birth')}}:</td>
                        <td>{{(isset($obj->born))?$obj->born:'не указано'}}</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.gender')}}:</td>
                        <td>{{(isset($obj->gender))?$obj->gender:'не указано'}}</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.city')}}:</td>
                        <td>{{(isset($obj->city))?$obj->city:'не указано'}}</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.marital_status')}}:</td>
                        <td>{{(isset($obj->maritalStatus))?$obj->maritalStatus:'не указано'}}</td>
                    </tr>
                    
                    <tr>
                        <td>{{__('menu.profile_information.favorite_music')}}:</td>
                        <td>
                            @if(isset($obj_user->music))
                            @foreach($obj_user->music as $one)
                            <a href="https://www.google.com/search?q={{$one->name}}" target="_blank">{{$one->name}}</a>
                            {{($loop->last)?'.':','}}
                            @endforeach
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.favorite_movies')}}:</td>
                        <td>@if(isset($obj_user->movie))
                            @foreach($obj_user->movie as $one)
                            <a href="https://www.google.com/search?q={{$one->name}}" target="_blank">{{$one->name}}</a>
                            {{($loop->last)?'.':','}}
                            @endforeach
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.favorite_books')}}:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.favorite_quotes')}}:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_information.about_me')}}:</td>
                        <td>{{(isset($obj->aboutMe))?$obj->aboutMe:'не указано'}}</td>
                    </tr>
                </table>

            </div>
            <div class="tab-pane fade" id="contacts" role="tabpanel" aria-labelledby="contacts-tab">
                <table>
                    <tr>
                        <td>{{__('menu.profile_contacts.mobile_phone')}}:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>Skype:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.profile_contacts.link_to_other_site')}}:</td>
                        <td>Указать</td>
                    </tr>
                </table>

            </div>
            <div class="tab-pane fade" id="career" role="tabpanel" aria-labelledby="career-tab">
                <table>
                    <tr>
                        <td>{{__('menu.user_info.place_of_work')}}:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>{{__('menu.user_info.position')}}:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>C .. по ..</td>
                        <td>Указать</td>
                    </tr>
                </table>

            </div>
            <div class="tab-pane fade" id="education" role="tabpanel" aria-labelledby="education-tab">
                <table>
                    <tr>
                        <td>Вуз/школа:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>Факультет:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>Специальность:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>Форма обучения:</td>
                        <td>Указать</td>
                    </tr>
                    <tr>
                        <td>Год окончания:</td>
                        <td>Указать</td>
                    </tr>
                </table>

            </div>
            <div class="tab-pane fade" id="friends" role="tabpanel" aria-labelledby="friends-tab">
                <div class="row">
                    @foreach($allfriends as $one)
                    <div class="col-sm-6">
                        @include('includes.friend')
                    </div>
                    @endforeach
                </div>

            </div>
        </div>

    </div>

    <br>

    <div class="card">
        <div class="card-header"><a href="{{asset('galery/'.$obj_user->id)}}">{{__('menu.profile_page.foto')}}</a> (количество)</div>
        <div class="card-body">
            Отобразить последние три

        </div>
    </div>
    <br>



<!-- Modal bg-->
<div class="modal fade " id="bgModal" tabindex="-1" role="dialog" aria-labelledby="bgModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bgModalLabel">Сменить фон</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form action="{{asset('/account/bg')}}" method="post" enctype="multipart/form-data">
      @csrf
          <div class="modal-body">
           <!--@include('includes.photoProfile',['classname'=>'bg'])-->
            @if($obj_user->accounts)
            @if($obj_user->accounts->bg_profile)
            @include('includes.cropper',['classname'=>'bg'])
            <!--<img src="{{asset('uploads/'.$obj_user->id.'/s'.$obj_user->accounts->bg_profile)}}" alt="Background"  id="bg_default" class="bg" style="width:100%;">-->
            
            @else
            <img src="{{asset('image/bg/minimalizm-oblaka-blue.jpg')}}" alt="Background" id="changed_bg" class="bg" style="width:450px;">
            @endif
            @else 
            <img src="{{asset('image/bg/minimalizm-oblaka-blue.jpg')}}" alt="Background" id="changed_bg" class="bg" style="width:450px;">
            @endif
           <!-- <div class="form-group">
                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="picture1" />
            </div>-->
        
      </div>
      
      <!--<div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
        <button type="submit" class="btn btn-primary">Загрузить</button>
      </div>-->
      </form>
    </div>
  </div>
</div>

<!-- Modal foto name-->
<div class="modal fade" id="avatarModal" tabindex="-1" role="dialog" aria-labelledby="avatarModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="avatarModalLabel">Редактировать основные сведения</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{asset('/account')}}" method="post" enctype="multipart/form-data">
      <div class="modal-body">
           @include('includes.photoProfile',['classname'=>'avatar1'])
            <!--@if($obj_user->accounts)
            @if($obj_user->accounts->photo_profile)
            <img src="{{asset('uploads/'.$obj_user->id.'/'.$obj_user->accounts->photo_profile)}}" alt="Avatar"  id="avatar_default" class="avatar1">
            
            @else
            <img src="{{asset('image/avatar/icons8-user-settings-100.png')}}" alt="Avatar" id="changed_avatar" class="avatar1">
            @endif
            @else 
            <img src="{{asset('image/avatar/icons8-user-settings-100.png')}}" alt="Avatar" id="changed_avatar" class="avatar1">
            @endif-->
           @csrf
            <div class="form-group">
                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="picture1" />
            </div>
        <!---------->  
           <div class="form-group">
                <label for="name">Имя</label>
                <input type="text" class="form-control" id="name" name="name" value="{{auth::user()->name}}" required>
            </div> 
            <div class="form-group">
                <label for="surname">Фамилия</label>
                <input type="text" class="form-control" id="surname" name="surname" value="{{(auth::user()->accounts) ? auth::user()->accounts->surname : ''}}">
            </div> 
            <div class="form-group">
                <label for="status">Статус</label>
                <textarea rows="2" class="form-control" id="status" name="status">{{(auth::user()->accounts) ? auth::user()->accounts->status : ''}}</textarea>
            </div> 
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="show_contacts" name="show_contacts" @if(auth::user()->accounts){{(auth::user()->accounts->show_contacts == 1) ? 'checked' : ''}}@endif>
                
                <label class="form-check-label" for="show_contacts">Отображать на странице профиля контактные данные</label>
            </div> 
            <div class="form-group">
                <label for="phone">Телефон в формате 8-0xx-xxx-xx-xx:</label>
                <input type="tel" name="phone" class="form-control" id="phone" value="{{(auth::user()->accounts) ? auth::user()->accounts->phone : ''}}" pattern="8-0[0-9]{2}-[0-9]{3}-[0-9]{}-[0-9]{2}">
            </div> 
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" disabled value="{{auth::user()->email}}">
            </div>
            
            
            
        <!--******-->
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
        <button type="submit" class="btn btn-primary">Загрузить</button>
      </div>
      </form>
    </div>
  </div>
</div>

</div>
@endsection
