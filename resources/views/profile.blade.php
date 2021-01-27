@extends('layouts.app')

@section('content')



<div class="container">

    <div class="card " id="foto_profile">
        <img src="../image/minimalizm-oblaka-blue.jpg" class="card-img-top avatar-top" alt="Фото профиля">
        <img src="../image/avatar.jpg" alt="Avatar" class="avatar">
        <div class="card-body fio" id="fio">
            <h5 class="card-title">Фамилия и имя</h5>
            <p class="card-text">{{__('menu.user_info.position')}}</p>
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
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                               <img src="../image/icons8-male-user-100.png" alt="Avatar" class="avatarFriend">
                                <div class="fio">                               
                                <h5 class="card-title">Фамилия Имя</h5>
                                <p class="card-text">{{__('menu.buttons.online')}} / {{__('menu.buttons.offline')}}</p>
                                <a href="#" class="btn btn-primary">{{__('menu.buttons.write_message')}}</a>
                                <a href="#" class="btn btn-primary">{{__('menu.buttons.be_friends')}}/{{__('menu.buttons.unsubscribe')}}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                               <img src="../image/icons8-male-user-100.png" alt="Avatar" class="avatarFriend">
                                <div class="fio">                               
                                <h5 class="card-title">Фамилия Имя</h5>
                                <p class="card-text">{{__('menu.buttons.online')}} / {{__('menu.buttons.offline')}}</p>
                                <a href="#" class="btn btn-primary">{{__('menu.buttons.write_message')}}</a>
                                <a href="#" class="btn btn-primary">{{__('menu.buttons.be_friends')}}/{{__('menu.buttons.unsubscribe')}}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <br>

    <div class="card">
        <div class="card-header"><a href="{{asset('galery')}}">{{__('menu.profile_page.foto')}}</a> (количество)</div>
        <div class="card-body">
            Отобразить последние три

        </div>
    </div>
    <br>



    <!--Стена-->


    <!---->

</div>
@endsection
