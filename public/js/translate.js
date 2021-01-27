$(function () {
    $('.translate').on('click', function(e) {
        e.preventDefault();
        let data_id = $(this).attr('data-id');
        $.ajax({
            url: '/ajax/translater',
            data: 'data_id='+data_id,
            type: 'post',
            /*headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },*/
            success: function (data) {
                $('#translate-' + data_id).html(data);
            },
            error: function (data) {
                console.log(data);
            }
        })
    })
})
