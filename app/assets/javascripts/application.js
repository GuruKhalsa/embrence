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
//= require fancybox
//= require bootstrap
//= require turbolinks
//= require_tree .

// $(function() {
//   $("#ajax_images .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });

// 	$("#ajax_videos .pagination a").live("click", function() {
// 	 $.getScript(this.href);
// 	 return false;
// 	});

//   $("#ajax_messages .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });
// });


function validateFiles(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB)";
  var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
  var allowedExtension = ["jpg", "jpeg", "gif", "png"];
 
  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;
 
  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop().toLowerCase();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    window.alert(maxExceededMessage);
    $(inputFile).val('');
  };
 
  if (extError) {
    window.alert(extErrorMessage);
    $(inputFile).val('');
  };
}

function validateVideos(inputFile) {
  var maxExceededMessage2 = "This file exceeds the maximum allowed file size (50 MB)";
  var extErrorMessage2 = "Only video file with extension: .mp4, .mov, .avi, .mpg, .mpeg, .m4v, or .swf is allowed";
  var allowedExtension2 = ["mpg", "mpeg", "mov", "avi", "swf", "mp4", "m4v"];
 
  var extName2;
  var maxFileSize2 = $(inputFile).data('max-file-size');
  var sizeExceeded2 = false;
  var extError2 = false;
 
  $.each(inputFile.files, function() {
    if (this.size && maxFileSize2 && this.size > parseInt(maxFileSize2)) {sizeExceeded2=true;};
    extName2 = this.name.split('.').pop().toLowerCase();
    if ($.inArray(extName2, allowedExtension2) == -1) {extError2=true;};
  });
  if (sizeExceeded2) {
    window.alert(maxExceededMessage2);
    $(inputFile).val('');
  };
 
  if (extError2) {
    window.alert(extErrorMessage2);
    $(inputFile).val('');
  };
}
