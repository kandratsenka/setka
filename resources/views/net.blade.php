@extends('layouts.app')

@section('content')
<div class="container">
<div class="row justify-content-center">
    <div class="col-3">
        @include('includes/allfriends')
    </div>
    <div class="col-5">
        <div class="tab-content" id="v-pills-tabContent">
            <div id="v-pills-search_net">
                <div class="container">
                    <div class="card">
                        <form action="{{asset('friends/add')}}" method="get">
                            @csrf

                            <input type="text" placeholder="Введите имя" name="user" value="{{request()->user}}" required>
                            <p><input type="submit" value="{{__('menu.buttons.search')}}"></p>
                        </form>
                        @if(isset($objs))
                        @foreach($objs as $one)
                        @include('includes.friend')
                        @endforeach
                        @endif


                    </div>
                </div>
            </div>


        </div>
    </div>
    @include('includes.search')
</div>
</div>
@endsection
