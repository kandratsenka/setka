$(function(){
    $('#wallpost').click(function(){
        var comment = $('#comment').html();
        console.log(comment);
    });
    $('.card-body img').each(function(index,value){
        console.log($(this),index,value);
        if($(this).width()>100){
            $(this).css({
            'width': '100%',
            'height': 'auto'
            })   
        }
        
    })
});
