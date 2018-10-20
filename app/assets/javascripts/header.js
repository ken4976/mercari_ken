$(function() {
  $(".pc-header-nav-child-wrap").on("mouseover", function() {
    var hoveringParent = $(this).prev().find('a');
    $(hoveringParent).addClass("active");
  });

  $(".pc-header-nav-child-wrap").on("mouseout", function() {
    var hoveringParent = $(this).prev().find('a');
    $(hoveringParent).removeClass("active");
  });


  $(".pc-header-nav-grand-child-wrap").on("mouseover", function() {
    var hoveringChild = $(this).prev();
    $(hoveringChild).addClass("active");
  });

  $(".pc-header-nav-grand-child-wrap").on("mouseout", function() {
    var hoveringChild = $(this).prev();
    $(hoveringChild).removeClass("active");
  });

});
