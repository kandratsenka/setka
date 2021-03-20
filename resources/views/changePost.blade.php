@extends('layouts.app')
@push('scripts')
<script src="{{asset('ckeditor5-build-classic/build/ckeditor.js')}}"></script>
<script src="{{asset('ckfinder/ckfinder.js')}}"></script>
<script>
    ClassicEditor
		.create( document.querySelector( '#commentEdit' ), {
            ckfinder: {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json&userId={{auth::user()->id}}'
            }
        }  )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( error => {
			console.error( 'There was a problem initializing the editor.', error );
		} );
</script>
<script src="{{asset('js/translate.js')}}"></script>
@endpush



@section('content')
<div class="container">
 <div class="row justify-content-center">
        <div class="col-12">
            <div class="tab-content" id="v-pills-tabContent">
                <div id="v-pills-search_friend" >
                    <div class="container">
                       
                       <form action="{{asset('publication/edit/'.$publication->id)}}" method="post" enctype="multipart/form-data" >
                        @csrf
                        <div class="form-group">
                            <div class="card-header" >
                               <!--<input type="button" id="ckfinder-popup-1" value="add file">-->
                                <label for="comment">{{__('menu.news_list.what_is_new')}}?</label>
                                <textarea class="form-control sk5" id="commentEdit" name="body" cols="3">{!!$publication->body!!}</textarea>
                                <input type="submit" id="wallpost" name="submit" value="{{__('menu.buttons.save')}}">
                            </div>
                            
                        </div>
                    </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

