$(document).ready(function (){

    $("#story_text_area").on("keyup", function (){
      let charCounter = $(this).closest("#story_text_area").val().length;
      $("#counter").text(400 - charCounter);
      if ($("#counter").text() < 0 ) {
        $("span#counter").addClass("notValid");
      } else if ($("#counter").text() > -1 && $("span").hasClass("notValid")){
        $("span#counter").removeClass("notValid")
      }
    });

});

// This changes the character counter everytime a key is released.
// The counter is given the class "notValid" when the character count is higher than 400.
// The class "notValid" is removed when the character count goes back to below 400.
