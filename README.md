# It's a happy place to begin.

![totoro](https://i.pinimg.com/474x/b6/64/2d/b6642de3ecb4c4c9c754336ce91889b7--totoro-cute-miyazaki-illustration.jpg)

## To-Dos:
  1. Homepage should be a pretty view of recent public jots.
  2. Upon login, the homepage stays the same, but the nav bar includes a username link and a 'jot' link.
  3. Username link goes to a show page of all the user's jots.
    * users cannot edit jots, but can choose which to make private/public
  4. Jot link goes to jots/new -- remember to follow unsplash guidelines!
    * show an unsplash photo for 60 seconds
    * display textarea below the photo for five minutes
    * display submit button to create the jot

## Read me:
Use #jot-popups on the jots/new.erb page to display "Look."
Fade it out after seconds. (Stretch: Fade out everything but the photo.)
After 60 seconds, fade in "Write." Also fade it out after 60 seconds.
When you fade in "Write.", it'd be cool to fade in and out a #222 1px
border around the textarea.
After 5 minutes of the textarea being active, notify the user that jot
time is up and display a submit button. (Stretch: Also the option to
submit the jot as public or private.)
Also stretch: It'd be cool to make a little dot or something that slowly
fades out over the course of 5 minutes. (Don't even think about touching
this until you've gotten all the goddamn functionality implemented!)



Dummy for jots/new.erb (reduce API calls...)
<div class="container">
   <div class="jot-block">
    <p class="right photog-attribution"><a href="https://unsplash.com/@johncobb">John Cobb</a> / <a href="https://unsplash.com/">Unsplash</a></p>
    <img class="unsplashed" src="https://images.unsplash.com/photo-1428542170253-0d2f063e92c2?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=433878ac7cefa63381b5bd0d265e0040">
  </div>
