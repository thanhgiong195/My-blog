jQuery(document).on('turbolinks:load', function() {
  $('#new_comment').submit(function(event) {
    event.preventDefault();
    var comment = $(this);
    var params = comment.serialize();
    $.ajax({
      url: comment.attr('action'),
      type: 'post',
      dataType: 'json',
      data: params,
    })
      .done(function(response) {
        if (response.status == 'success') {
          comment.closest('body').find('.comment').append(response.html);
          $('time.timeago').timeago();
          comment.closest('body').find('.f-comment').val('');
        }
      });
    return false;
  });

  $('body').on('click','.delete', function(event) {
    event.preventDefault();
    var delcomment = $(this);
    $.ajax({
      type: delcomment.attr('data-method'),
      url: delcomment.attr('href'),
      dataType: 'json',
      data: {},
    })
      .done(function (response) {
        if (response.status == 'success') {
          delcomment.closest('.time-comment').fadeOut('normal');
        }
      });
    return false;
  });

  $('body').on('click', '#show-cmt', function(event) {
    event.preventDefault();
    $('.comment').fadeToggle('medium');
    $('.comment-form').fadeToggle('medium');
  });
});

