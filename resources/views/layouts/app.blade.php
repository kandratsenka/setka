<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>


    <!-- Styles -->
    <link href="{{ asset('/bootstrap-4.5.2-dist/css/bootstrap.min.css') }}" rel="stylesheet">
    @section('styles')
    <link rel="stylesheet" href="{{asset('/css/main.css')}}">
    
    <link rel="stylesheet" href="{{asset('/css/shake.css')}}">
    @show

    


</head>

<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm" id="header-fon">
            <div class="container">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">
                        <!--<li class="nav-item"><a class="nav-link" href="{{asset('index')}}">Домой</a></li>
                        <li class="nav-item"><a class="nav-link" href="{{asset('groups')}}">Сообщество</a></li>
                        <li class="nav-item"><a class="nav-link" href="{{asset('friends')}}">Друзья</a></li>-->
                        <!-- <li class="nav-item"><a class="nav-link" href="{{asset('index')}}">Главная</a></li>-->
                        <li class="nav-item"><a class="nav-link {{($url =='/')?'active':''}}" href="{{asset('/')}}"> <img src="../image/icons8-business-network-32.png" alt="Сетка"> Сетка</a></li>
                        <li class="nav-item"><a class="nav-link {{($url =='/net')?'active':''}}" href="{{asset('net')}}">{{ __('menu.top.net') }}</a></li>
                        <li class="nav-item"><a class="nav-link {{($url =='/messages')?'active':''}}" href="{{asset('messages')}}">{{ __('menu.top.messages') }}</a></li>
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                        </li>
                        @if (Route::has('register'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                        </li>
                        @endif
                        @else

                        <li class="nav-item dropdown">

                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }}
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ __('menu.top.logout') }}</a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                                <hr>
                                <a href="{{asset('profile/'.Auth::user()->id)}}">{{__('menu.top.profile')}}</a>
                                <br>
                                <a href="{{asset('properties')}}">{{__('menu.top.settings')}}</a>
                                <hr>
                                <div id="admin_menu">{!!menu('Setting_admin','bootstrap')!!}
                                </div>                                
                            </div>

                        </li>
                        <div class="dropdown">

                            <!--**************Уведомления************************-->
                            <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="/image/icons8-alarm-20.png" alt="{{__('menu.top.notifications')}}" class="shake-rotate"
                                title="{{__('menu.top.notifications')}}">
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <!--Всплывающее окно с удомлением, закрывается на крестик-->
                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    Это основное уведомление с <a href="#" class="alert-link">примером ссылки</a>.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            
                        </div>
                        <!--**********************************-->
                        @endguest

                        <li class="dropdown">
                            <!--<span id="lanNavSel">{{App::getLocale()}}</span>-->
                            <img id="imgNavSel" src="/image/lang/{{App::getLocale()}}_40.jpg" alt="..." class="img-thumbnail icon-small">&nbsp;&nbsp;
                            <span class="caret"></span>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"></a>
                            <ul class="dropdown-menu mumu" role="menu">
                                <li><a id="navFra" href="/?lang=fr" class="language">
                                        <img id="imgNavFra" src="/image/lang/fr_40.jpg" alt="France" class="img-thumbnail icon-small">&nbsp;
                                        <span id="lanNavFra">Fr</span>&nbsp;
                                    </a></li>
                                <li><a id="navEng" href="/?lang=en" class="language">
                                        <img id="imgNavEng" src="/image/lang/en_40.jpg" alt="English" class="img-thumbnail icon-small">&nbsp;
                                        <span id="lanNavEng">En</span>&nbsp;
                                    </a></li>
                                <li><a id="navRus" href="/?lang=ru" class="language">
                                        <img id="imgNavRus" src="/image/lang/ru_40.jpg" alt="Russia" class="img-thumbnail icon-small">&nbsp;
                                        <span id="lanNavRus">Ru</span>&nbsp;
                                    </a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
    
    @if (Route::has('login'))
    <div class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
        @auth
            <a href="{{ route('authlogout') }}" class="text-sm text-gray-700 underline">Sign out</a>
        @else
            <a href="{{ route('authlogin') }}" class="text-sm text-gray-700 underline">Sign in / Register</a>
        @endauth
    </div>
@endif
    
    <script src="{{ asset('/js/jquery-3.5.1.min.js')}}"></script>
   <!-- <script src="{{ asset('/bootstrap-4.5.2-dist/js/bootstrap.min.js')}}"></script>-->
   <script src="{{asset('js/app.js')}}"></script>
    @stack('scripts')
</body>

</html>
