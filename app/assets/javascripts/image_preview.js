$(document).ready(function(){
  $(document).on("turbolinks:load", function (){
    var preview = $(".upload-preview img");

    $(".image").change(function(event){
       var input = $(event.currentTarget);
       var file = input[0].files[0];
       var reader = new FileReader();
       reader.onload = function(e){
           image_base64 = e.target.result;
           preview.attr("src", image_base64);
           preview.attr("style", "max-width: 200px; height: auto;")
       };
       reader.readAsDataURL(file);
    });
  })
});