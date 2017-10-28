$(document).ready(function() {

//------ Timer-based stuff for jots/new ------//
  // Show 'look' prompt:
function look() {
  $("#look").css("visibility", "visible").hide().fadeIn("slow");
}
function unlook() {
  $("#look").css("visibility", "hidden");
}

function write() {
  $("#write").css("visibility", "visible").hide().fadeIn("slow");
  $("#textarea-border").css("visibility", "visible").hide().fadeIn("slow");
  $("textarea").css("visibility", "visible");
}
function unborder() {
  $("#textarea-border").css("visibility", "hidden");
}
function unwrite() {
  $("#write").css("visibility", "hidden");
}
function publish() {
  $("#publish").css("visibility", "visible").hide().fadeIn("slow");
}

  window.setTimeout(look, 5000);
  window.setTimeout(unlook, 10000);
  window.setTimeout(write, 15000);
  window.setTimeout(unborder, 20000);
  window.setTimeout(unwrite, 25000);
  window.setTimeout(publish, 35000);

  // Maybe hide all the other on-page elements?! That'd be dope!













//------ Session and New User Stuff ------/
  // Show login form:
  $("#session-manager").on("click", "#login-link", function(event) {
    event.preventDefault();
    var $li = $(this);
    var url = $li.find("a").attr("href");
    var request = $.ajax({
      url: url
    })
    request.done(function(response) {
      $li.closest("nav").siblings().remove();
      $li.closest("div").append(response);
    })
  })

  // Show login error or update with a logged-in view:
  $("#session-manager").on("submit", "#login-form", function(event) {
    event.preventDefault();
    var $loginForm = $(this)
    var url = $loginForm.attr("action");
    var method = $loginForm.attr("method");
    var data = $loginForm.serialize();
    $loginForm.children().remove();
    console.log(data)
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $loginForm.closest("#session-manager").children().remove();
      $("body").find("#session-manager").append(response);
    })
  })

  // Show registration form!
  $("#session-manager").on("click", "#register-link", function(event) {
    event.preventDefault();
    var $li = $(this);
    var url = $li.find("a").attr("href");
    var request = $.ajax({
      url: url
    })
    request.done(function(response) {
      $li.closest("nav").siblings().remove();
      $li.closest("div").append(response);
    })
  })

  // Show registration error(s) or update with a logged-in view:
  $("#session-manager").on("submit", "#registration-form", function(event) {
    event.preventDefault();
    var $registrationForm = $(this);
    var url = $registrationForm.attr("action");
    var method = $registrationForm.attr("method");
    var data = $registrationForm.serialize();
    $registrationForm.children().remove();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $registrationForm.closest("#session-manager").children().remove();
      $("body").find("#session-manager").append(response);
    })
  })

});











