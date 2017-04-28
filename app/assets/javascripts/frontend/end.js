$(function() {
  $('.carousel').carousel({
    interval: 4000
  })

  $('a.newsletter-link').on('click', function(event) {
    event.preventDefault();
    $(this).parents('form').submit();
  })

  $('textarea').autoGrow();

  if($('.photo-list').length) {
    var leftPos = $('.photo-list').position().left + $('.photo-list').width() + 50,
        $backToTop = $('#back-to-top');

    $backToTop.css("left", leftPos).on('click', function(e) {
      e.preventDefault();
      $('body,html').animate({
        scrollTop : 0
      }, 500);
    });
  }

  $(window).scroll(function() {
    if ($(this).scrollTop() >= 50) {
      $('#back-to-top').fadeIn(200);
    } else {
      $('#back-to-top').fadeOut(200);
    }
  });
});
