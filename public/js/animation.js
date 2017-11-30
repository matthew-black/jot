$(document).ready(function() {

// Functions to make the on-page script do its thing:
  // (Refactor this stuff to be a function that takes an argument.)
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
  $("#photog-info").remove();
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

// // One last relaxing breath:
  window.setTimeout(magic, 55000)
  window.setTimeout(unmagic, 57000)

// Make the space real pretty:
  window.setTimeout(clear, 59000);

// Display 'write' prompt:
  window.setTimeout(write, 59500);
  window.setTimeout(unwrite, 70000);

// Display textarea:
  window.setTimeout(text, 71000);
  window.setTimeout(border, 71000);
  window.setTimeout(unborder, 85000);


// Display save button:
  window.setTimeout(save, 375000);

});