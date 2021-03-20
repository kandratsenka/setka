$(function(){
    $('#save').click(function(){
       /*var href=$('#download').attr('href'); */
        var canvasElement = document.querySelector('#cropper_save_final canvas');
        if(canvasElement.width > 4096){
            alert("Слишком большое изображение!");
        }else{
            var canvasData = canvasElement.toDataURL('image/png');
            $.ajax({
            'type':'POST',
            'url':'/ajax/bg_profile',
            'data':'url='+canvasData,
            'success':function(){
                document.location.href = '/profile';
            }
        })    
        }
        
    });
})