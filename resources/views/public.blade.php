@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
           <div class="card">
                        <div class="card-header">
                            
                        </div>
                        <div class="card-body">
                            <p class="card-text" id="translate-{{$one->id}}">{!!$one->body!!}</p>
                            <a href="#" data-id="{{$one->id}}" class="translate">{{__('menu.buttons.show_translation')}}</a>
                            
                            <br>
                            <a href="#" class="btn btn-primary"><img src="../image/like-16.png">Like</a>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentL">
                              {{__('menu.buttons.comment')}}
                            </button>
                        </div>
                    </div>
                    <br>
        </div>
    </div>
</div>
@endsection

                    