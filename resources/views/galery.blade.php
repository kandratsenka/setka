@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">Галлерея
                <div class="card-header"></div>

                <div class="card-body">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Фото</a>
                            <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Альбомы</a>
                            <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Добавить фото</a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            @foreach($pictures as $pic)
                            <div class="col-4">
                                <img src="{{asset('uploads/'.$pic->user_id.'/ss'.$pic->files)}}">
                            </div>
                            @endforeach
                        </div>
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">Альбомы</div>
                        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">Добавить фото
                            <form action="{{asset('/galery/add')}}" method="post" enctype="multipart/form-data">
                               @csrf
                                <select class="form-control" name="album_id">
                                    @foreach($albums as $one)
                                    <option value="{{$one->id}}">{{$one->name}}</option>
                                    @endforeach
                                </select>
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" name="description">{{date('d-m-Y')}}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Example file input</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="picture1" />
                                    <button type="submit" class="btn btn-primary">Загрузить</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
