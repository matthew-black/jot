$(document).ready(function() {

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











