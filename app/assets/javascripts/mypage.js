$(function() {
  $(document).on('turbolinks:load', function() {
    $('#mypage_tab_container_notification_todo .mypage-tabs li').on("click", function(e) {
      e.preventDefault();
      var attr = $(this).find('a').attr("href");

      $('#mypage_tab_container_notification_todo .mypage-tabs li').removeClass('active');
      $(this).addClass('active');

      $('#mypage_tab_container_notification_todo .tab-content .mypage-item-list').removeClass('active');
      $(attr).addClass('active');
    });

    $('#mypage_tab_container .mypage-tabs li').on("click", function(e) {
      e.preventDefault();
      var attr = $(this).find('a').attr("href");

      $('#mypage_tab_container .mypage-tabs li').removeClass('active');
      $(this).addClass('active');

      $('#mypage_tab_container .tab-content .mypage-item-list').removeClass('active');
      $(attr).addClass('active');
    });
  });
});
