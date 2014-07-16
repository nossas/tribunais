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
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){
  $(document).foundation();

  if(window.location.hash){
    $(window.location.hash).foundation('reveal', 'open');
    if(window.location.hash == "#gandalf"){
      document.getElementById("gandalf-audio").play();
    }
  }

  $(".button.facebook-share").click(function(event){
    window.open(
      $(event.target).attr("href"),
      'facebox-share-dialog',
      'width=626,height=436'
    );
    return false;
  });

  $(".button.twitter-share").click(function(event){
    window.open(
      $(event.target).attr("href"),
      'twitter-share-dialog',
      'width=626,height=436'
    );
    return false;
  });

  $(window).scroll(function(){
    // fixed form
    if(typeof new_poke_y === "undefined")
      new_poke_y = $(".new_poke").position().top

    console.log("window.scrollY: " + window.scrollY + ", new_poke_y: " + new_poke_y);
    if(window.scrollY >= new_poke_y && $(document).width() > 735){
      $(".form_wraper").addClass("fixed");
      $(".email_message").css("margin-top", $(".form_wraper").height() + "px");
    } else{
      $(".form_wraper").removeClass("fixed");
      $(".email_message").css("margin-top", "0");
    }

    // Parallax
    scrollRatio = window.scrollY/$(document).height();
    scrollProgress = ((window.scrollY/$(document).height()) * 100) + "%";
    invertedScrollProgress = (100 - ((window.scrollY/$(document).height()) * 100)) + "%";
    scrollProgressPx = ((window.scrollY/$(document).height()) * 1000) + "px";
    invertedScrollProgressPx = (10000 - (window.scrollY/$(document).height()) * 10000) + "px";

    slide1Height = $(".slide-1").height() + parseInt($(".slide-1").css("padding-top")) + parseInt($(".slide-1").css("padding-bottom"));
    slide1BgHeight = 896;
    slide1ScrollRatio = window.scrollY/($(".slide-1").position().top + slide1Height);
    slide1Offset = slide1BgHeight - slide1Height;
    slide1Position = (slide1Offset * slide1ScrollRatio) + "px";

    $(".slide-1").css("background-position", "center " + slide1Position);
    $(".slide-2").css("background-position", scrollProgress + " 40%");
  });
});
