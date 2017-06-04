$(document).ready(function() {
  // To enable javascript reload on page navigation
  document.addEventListener("turbolinks:load", function() {
    // Carousel initialization
    var owl = $('.owl-carousel');
    owl.owlCarousel({
      items:4,
      dots:true,
      loop:true,
      margin:10,
      autoplay:true,
      autoplayTimeout:1000,
      autoplayHoverPause:true
    });
    // Carousel Navigation
    $('.left-arrow').click(function() {
      var owl_parent = $(this).parent();
      var owl = owl_parent.find('.owl-carousel');
      owl.trigger('prev.owl');
    });
    $('.right-arrow').click(function() {
      var owl_parent = $(this).parent();
      var owl = owl_parent.find('.owl-carousel');
      owl.trigger('next.owl');
    });

    // Tooltip for delete button in topic show view
    $('.tooltip-wrapper').tooltip();
  });
});
