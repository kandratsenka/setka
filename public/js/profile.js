$(function(){
    $('#foto_name_profile').on({
        'mouseover' : function(){
            $('#avatar_showhite').show();
        },
        'mouseout' : function(){
            $('#avatar_showhite').hide();
        }
    })
    $('#bg_profile').on({
        'mouseover' : function(){
            $('#bg_showhite').show();
        },
        'mouseout' : function(){
            $('#bg_showhite').hide();
        }
    })
})