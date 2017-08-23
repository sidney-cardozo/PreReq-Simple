$('.delete_pair').bind(ajax:success, function() {
        $(this).closest('tr').fadeOut();
});