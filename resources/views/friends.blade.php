@extends('layouts.app')

@section('content')
<div class="container">
 <div class="row justify-content-center">
        <div class="col-3 ">
           @include('includes.allfriends')
        </div>
        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
                <div id="v-pills-search_friend" >
                    <div class="container">
                        @foreach($allfriends as $one)
                      
                        @include('includes.friend')
                        @endforeach
                        
                    </div>
                </div>
               

            </div>
        </div>
    </div>
</div>
@endsection
