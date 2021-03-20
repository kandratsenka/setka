@extends('layouts.app')

@section('content')
<div class="container">
   
    <div class="row">
        <div class="col-3">
            @include('includes.message_menu')
        </div>
        <div class="col-9">

            <div class="container">
                <div class="card">
                    <form method="post">
                       @csrf
                        <p><select name="resiver_id">
                            
                                <option disabled>Кому?</option>
                                    @foreach($friends as $one)
                                    <option value="{{$one->id}}">{{$one->name}}</option>
                                    @endforeach

                            </select></p>
                        <input type="text" placeholder="Напишите что-нибудь" name="body">
                        @error('body')
                            <div>
                                {{$message}}
                            </div>
                        @enderror
                        <p><input type="submit" value="{{__('menu.buttons.send')}}"></p>
                    </form>


                    История переписки
                </div>
            </div>

        </div>
    </div>

</div>
@endsection
