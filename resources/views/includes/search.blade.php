<div class="col-3">

        <div class="card">
            <div class="card-header">
                Расширенный поиск
            </div>
            <div class="card-body">
                
                <form method="post" action="{{asset('/friends/search')}}">
                   @csrf
                    <div class="form-group row">
                        <label for="inputState" class="col-form-label col-sm-5"><b>Город</b></label>
                        <input type="text" id="inputState" class="form-control col-sm-7" name="city">
                        
                    </div>
                    <div class="form-group row">
                        <label for="inputSchool" class="col-form-label col-sm-5"><b>Школа</b></label>
                        <select id="inputSchool" class="form-control col-sm-7">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label for="inputUniversity" class="col-form-label col-sm-5"><b>Университет</b></label>
                        <select id="inputUniversity" class="form-control col-sm-7">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label for="inputAge" class="col-form-label col-sm-8"><b>Возраст</b></label>

                        <select id="inputAgeFrom" class="form-control col-sm-5 ml-3" name="inputAgeFrom">
                            <option selected value="0">От</option>
                            @for($i=14; $i <= 120; $i++)
                            <option value="{{$i}}">{{$i}}</option>
                            @endfor
                        </select>
                        <span>&nbsp; - &nbsp; </span>
                        <select id="inputAgeTo" class="form-control col-sm-5" name="inputAgeTo">
                            <option selected value="120">До</option>
                            @for($i=14; $i <= 120; $i++)
                            <option value="{{$i}}">{{$i}}</option>
                            @endfor
                        </select>
                    </div>

                    <fieldset class="form-group row">
                        <legend class="col-form-label col-sm-8 pt-0"><b>Пол</b></legend>
                        <div class="col-sm-7">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="Мужской" >
                                <label class="form-check-label" for="gridRadios1">
                                    Мужской
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="Женский">
                                <label class="form-check-label" for="gridRadios2">
                                    Женский
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="radio" name="gender" id="gridRadios3" value="" checked >
                                <label class="form-check-label" for="gridRadios3">
                                    Любой
                                </label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-group row">
                        <label for="maritalStatus" class="col-sm-8 col-form-label"><b>{{__('menu.profile_information.marital_status')}}</b></label>
                        <div class="col-sm-12">
                            <select class="form-control" id="maritalStatus" name="maritalStatus">
                                <option selected>В поиске</option>
                                <option>Холост</option>
                                <option>Женат/Замужем</option>
                                <option>В отношениях</option>
                                <option>Не беспокоить</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Подобрать</button>
                </form>
            </div>
        </div>


    </div>