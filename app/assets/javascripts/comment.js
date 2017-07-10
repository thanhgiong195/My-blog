$(document).on('turbolinks:load', function() {
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

 $('body').on('click', '.edit-post-comment', function(event) {
    event.preventDefault();
    $(this).next().next().fadeToggle();
  });

 $('body').on('submit', '.ed-comment', function(event) {
   event.preventDefault();
   var self = $(this);
   var params_edit_comment = self.serialize();
   $.ajax({
     url: self.attr('action'),
     type: 'put',
     dataType: 'json',
     data: params_edit_comment,
   })
   .done(function(response) {
     self.closest('.cmt-content').find('.text-comment').text(response.content);
     $('.form-edit').hide();
   })
   .fail(function() {
     console.log("error");
   })
   .always(function() {
     console.log("complete");
   });
 });

  $('body').on('click', '#show-cmt', function(event) {
    event.preventDefault();
    $('.comment').fadeToggle('medium');
    $('.comment-form').fadeToggle('medium');
    return false;
  });
});
