@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">                  {{__('menu.top.settings')}}
                </div>
     <!--************Информация (не подключены музыка, фильмы, книги, цитаты)*****************--> 
                <div class="card-body">
                    <h5 class="card-title">{{__('menu.profile_page.information')}}</h5>
                    <div class="card-text">
                        <form action="{{asset('properties/add')}}" method="post">
                            @csrf

                            <div class="form-group row">
                                <label for="born" class="col-sm-2 col-form-label">{{__('menu.profile_information.date_of_birth')}}:</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="born" name="born" value="{{$obj->born}}" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="gender" class="col-sm-2 col-form-label">{{__('menu.profile_information.gender')}}:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="gender" name="gender">
                                        <option>Мужской</option>
                                        <option>Женский</option>
                                        <option>Любой</option>
                                    </select>

                                </div>
                            </div>
                           
                            <div class="form-group row">
                                <label for="city" class="col-sm-2 col-form-label">{{__('menu.profile_information.city')}}:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="city" name="city" value="{{$obj->city}}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="maritalStatus" class="col-sm-2 col-form-label">{{__('menu.profile_information.marital_status')}}:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="maritalStatus" name="maritalStatus">
                                        <option value="idle" {{($obj->maritalStatus=='idle')?'selected':''}}>Холост</option>
                                        <option value="married" {{($obj->maritalStatus=='married')?'selected':''}}>Женат/Замужем</option>
                                        <option value="inSearch" {{($obj->maritalStatus=='inSearch')?'selected':''}}>В поиске</option>
                                        <option value="inRelationship" {{($obj->maritalStatus=='inRelationship')?'selected':''}}>В отношениях</option>
                                        <option value="doNotDisturb" {{($obj->maritalStatus=='doNotDisturb')?'selected':''}}>Не беспокоить</option>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="music" class="col-sm-2 col-form-label">{{__('menu.profile_information.favorite_music')}}:</label>
                                <div class="col-sm-10">
                                   <textarea class="form-control" id="music" name="music" cols="3" rows="3">@foreach($obj_musics as $music) {{(isset($music->musics->name))?$music->musics->name:''}},@endforeach</textarea>
                                    
                                </div>
                            </div>

                           
                            <div class="form-group row">
                                <label for="movie" class="col-sm-2 col-form-label">{{__('menu.profile_information.favorite_movies')}}:</label>
                                <div class="col-sm-10">
                                   <textarea class="form-control" id="movie" name="movie" cols="3" rows="3">@foreach($obj_movies as $movie){{(isset($movie->movies->name))?$movie->movies->name:''}},@endforeach</textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="books" class="col-sm-2 col-form-label">{{__('menu.profile_information.favorite_books')}}:</label>
                                <div class="col-sm-10">
                                   <textarea class="form-control" id="books" name="books" cols="3" rows="3"></textarea>
                                </div>
                            </div>

                               <div class="form-group row">
                                <label for="quotes" class="col-sm-2 col-form-label">{{__('menu.profile_information.favorite_quotes')}}:</label>
                                <div class="col-sm-10">
                                   <textarea class="form-control" id="quotes" name="quotes" cols="3" rows="3"></textarea>
                                    
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="aboutMe" class="col-sm-2 col-form-label">{{__('menu.profile_information.about_me')}}:</label>
                                <div class="col-sm-10">
                                   <textarea class="form-control" id="aboutMe" name="aboutMe" cols="3" rows="3">{{$obj->aboutMe}}</textarea>
                                </div>
                            </div>
                            
                            <input type="submit" class="btn btn-primary" value="{{__('menu.buttons.save')}}">
                        </form>
                    </div>
                    
                </div>
                <hr>
              <!--************Контакты (не подключено)*****************-->  
                
                <div class="card-body">
                    <h5 class="card-title">Контакты</h5>
                    <div class="card-text">
                        <form action="{{asset('properties/add')}}" method="post">
                            @csrf
                                                    
                           
                            <div class="form-group row">
                                <label for="telephone" class="col-sm-2 col-form-label">Мобильный телефон:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="telephone" name="telephone" value="{{$obj->telephone}}">
                                </div>
                            </div>

                           <div class="form-group row">
                                <label for="skype" class="col-sm-2 col-form-label">Skype:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="skype" name="skype" value="{{$obj->skype}}">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="otherSite" class="col-sm-2 col-form-label">Другой сайт:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="otherSite" name="otherSite" value="{{$obj->otherSite}}">
                                </div>
                            </div>

                            <input type="submit" class="btn btn-primary" value="{{__('menu.buttons.save')}}">
                        </form>
                    </div>
                    
                </div>
               <hr>             
            <!--************Карьера (не подключено)*****************-->  
                
                <div class="card-body">
                    <h5 class="card-title">Карьера</h5>
                    <div class="card-text">
                        <form action="{{asset('properties/add')}}" method="post">
                            @csrf
                                                    
                           
                            <div class="form-group row">
                                <label for="place_of_work" class="col-sm-2 col-form-label">Место работы:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="place_of_work" name="place_of_work" value="{{$obj->place_of_work}}">
                                </div>
                            </div>

                           <div class="form-group row">
                                <label for="position" class="col-sm-2 col-form-label">Должность:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="position" name="position" value="{{$obj->position}}">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="from" class="col-sm-2 col-form-label">С: </label>
                                <div class="col-sm-4">
                                    <select class="form-control" id="from" name="from">
                                        <option>c</option>
                                        <option>2000</option>
                                        <option>2005</option>
                                        <option>2010</option>
                                        <option>2015</option>
                                        <option>2020</option>
                                    </select>

                                </div>
                                <label for="to" class="col-sm-2 col-form-label">до: </label>
                                <div class="col-sm-4">
                                    <select class="form-control" id="to" name="to">
                                        <option>до</option>
                                        <option>2000</option>
                                        <option>2005</option>
                                        <option>2010</option>
                                        <option>2015</option>
                                        <option>2020</option>
                                        <option>по настоящее время</option>
                                    </select>

                                </div>
                            </div>

                            <input type="submit" class="btn btn-primary" value="{{__('menu.buttons.save')}}">
                        </form>
                    </div>
                    
                </div>
                
               <hr> 
              <!--************Образование (не подключено)*****************-->  
                
                <div class="card-body">
                    <h5 class="card-title">Образование</h5>
                    <div class="card-text">
                        <form action="{{asset('properties/add')}}" method="post">
                            @csrf
                                                    
                           
                            <div class="form-group row">
                                <label for="place_of_education" class="col-sm-2 col-form-label">ВУЗ/Школа:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="place_of_education" name="place_of_education" >
                                </div>
                            </div>

                           <div class="form-group row">
                                <label for="faculty" class="col-sm-2 col-form-label">Факультет:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="faculty" name="faculty">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="specialty" class="col-sm-2 col-form-label">Специальность:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="specialty" name="specialty" >
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="form_of_study" class="col-sm-2 col-form-label">Форма обучения:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="form_of_study" name="form_of_study">
                                </div>
                            </div>

                           <div class="form-group row">
                                <label for="year_of_ending" class="col-sm-2 col-form-label">Год окончания:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="year_of_ending" name="year_of_ending">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary" value="{{__('menu.buttons.save')}}">
                        </form>
                    </div>
                    
                </div>
                            
            <!--*****************************-->        
            </div>
        </div>
   
    </div>
</div>
@endsection
