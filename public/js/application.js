$(document).ready(function() {

// Functions to make the on-page script do its thing:
  // (Refactor this crap to be a function that takes an argument.
  // But get some goddamn sleep first, or you'll break everything.)
function look() {
  $("#look").fadeIn("slow");
}
    function unlook() {
    $("#look").fadeOut("slow");
    }

function inhale() {
  $("#inhale").fadeIn("slow");
}
    function inhaleX() {
      $("#inhale").fadeOut("slow");
    }

function hold() {
  $("#pause").fadeIn("slow");
}
    function holdX() {
      $("#pause").fadeOut("slow");
    }

function exhale() {
  $("#exhale").fadeIn("slow");
}
    function exhaleX() {
      $("#exhale").fadeOut("slow");
    }

function write() {
  $("#write").fadeIn("slow");
}
    function unwrite() {
      $("#write").fadeOut("slow");
    }

function clear() {
  $("#disappear-me").remove();
  $(".photog-attribution").remove();
}

function magic() {
  $("#do-magic").fadeIn("slow");
}
  function unmagic() {
    $("#do-magic").fadeOut("slow");
  }

function text() {
  $("textarea").css("visibility", "visible")
}

function border() {
  $("#textarea-border").css("box-shadow", "0 0 3em #D0D0D0")
}
    function unborder() {
      $("#textarea-border").css("box-shadow", "none")
    }

function save() {
  $("#save").css("visibility", "visible").hide().fadeIn("slow");
}

$()
// You must hide the things before you show the things.
  $("#look").hide();
  $("#inhale").hide();
  $("#pause").hide();
  $("#exhale").hide();
  $("#write").hide();
  $("#do-magic").hide();


// Focus user's attention:
  window.setTimeout(look, 1000);
  window.setTimeout(unlook, 3000);

// One-minute deep breathing exercise:
  // Maybe offer three breath-length options!
  // (This one's a little quick, but a great intro for folks who aren't
  //  usually into doing breathing stuff...)
  // Anywho, maybe three buttons. Something like:
    // ?? "I'm new." "I'm into this." "I'm basically a Yogi." ??
  window.setTimeout(inhale, 5000);
    window.setTimeout(inhaleX, 8000);
  window.setTimeout(hold, 9000);
    window.setTimeout(holdX, 11000);
  window.setTimeout(exhale, 12000);
    window.setTimeout(exhaleX, 16400);

  window.setTimeout(inhale, 17400);
    window.setTimeout(inhaleX, 20400);
  window.setTimeout(hold, 21400);
    window.setTimeout(holdX, 23400);
  window.setTimeout(exhale, 24400);
    window.setTimeout(exhaleX, 28800);


  window.setTimeout(inhale, 29800);
    window.setTimeout(inhaleX, 32800);
  window.setTimeout(hold, 33800);
    window.setTimeout(holdX, 35800);
  window.setTimeout(exhale, 36800);
    window.setTimeout(exhaleX, 41200);

  window.setTimeout(inhale, 42200);
    window.setTimeout(inhaleX, 45200);
  window.setTimeout(hold, 46200);
    window.setTimeout(holdX, 48200);
  window.setTimeout(exhale, 49200);
    window.setTimeout(exhaleX, 53600);

// One last relaxing breath:
  window.setTimeout(magic, 55000)
  window.setTimeout(unmagic, 57000)

// Make the space real pretty:
  window.setTimeout(clear, 59000);

// Display 'write' prompt:
  window.setTimeout(write, 59500);
  window.setTimeout(unwrite, 72000);

// Display textarea:
  window.setTimeout(text, 75000);
  window.setTimeout(border, 75000);
  window.setTimeout(unborder, 90000);


// Display save button:
  window.setTimeout(save, 375000);

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











