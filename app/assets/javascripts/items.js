$(function() {
  $(document).on('turbolinks:load', function() {
    $('#thumb0').hover(function() {
      $('#image0').css('display','block'),
      $('#image1').css('display','none');
      $('#image2').css('display','none');
      $('#image3').css('display','none');
    });
    $('#thumb1').hover(function() {
      $('#image0').css('display','none'),
      $('#image1').css('display','block');
      $('#image2').css('display','none');
      $('#image3').css('display','none');
    });
    $('#thumb2').hover(function() {
      $('#image0').css('display','none'),
      $('#image1').css('display','none');
      $('#image2').css('display','block');
      $('#image3').css('display','none');
    });
    $('#thumb3').hover(function() {
      $('#image0').css('display','none'),
      $('#image1').css('display','none');
      $('#image2').css('display','none');
      $('#image3').css('display','block');
    });
  });
});
