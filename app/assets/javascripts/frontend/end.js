$(function() {
  $('.carousel').carousel({
    interval: 4000
  })

  $('a.newsletter-link').on('click', function(event) {
    event.preventDefault();
    $(this).parents('form').submit();
  })

  $('textarea').autoGrow();
});