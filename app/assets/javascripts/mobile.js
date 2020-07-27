// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/jquery
//= require jquery/jquery-ui.min

//= require weui/jquery-weui.min
//= require weui/swiper.min
//= require weui/zepto
//= require weui/fastclick



$(window).scroll(function () {
    var hScroll = $(this).scrollTop();

    if (hScroll > 0) {
        $('.navbar-default').addClass('sticky')
    } else {
        $('.navbar-default').removeClass('sticky');
    }

    if (hScroll > 800) {
        $('.scroll-top').fadeIn();
    } else {
        $('.scroll-top').fadeOut();
    }
});

