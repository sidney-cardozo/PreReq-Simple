$(document).ready(function(){
  $("a#register-employer").on("click", function(){
    $("#radio-employer").prop("checked", true)
  });

  $("a#register-applicant").on("click", function(){
    $("#radio-applicant").prop("checked", true)
  });
});
