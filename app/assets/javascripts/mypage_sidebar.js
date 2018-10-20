$(function() {
  $(document).on('turbolinks:load', function() {
  $(".mypage-nav-list-item").on("mouseover", function() {
    $(this).css('background', '#EEEEEE');
    var faAngleRight = $(this).find(".fa-angle-right");
    $(faAngleRight).css('color', 'black');
    $(faAngleRight).animate({
    'right': '12px',
  }, 0, 'easing');
  });

 $(".mypage-nav-list-item").on("mouseout", function(){
    $(this).css('background', 'white');
    var faAngleRight = $(this).find(".fa-angle-right");
    $(faAngleRight).css('color', '#ccc');
    $(faAngleRight).animate({
    'right': '16px',
  }, 0, 'easing');
  });
});
});
