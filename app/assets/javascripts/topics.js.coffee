# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.bind_topic = (id) ->
  $(id).bind('ajax:beforeSend',
             (evt, xhr, settings) ->
               $('#subtopics').html("<h3>Stand by</h3>")).
  bind('ajax:success',
       (evt, data, status, xhr) ->
         $('#subtopics').html(xhr.responseText)).
  bind('ajax:error',
       (evt, data, status, xhr) ->
         $('#subtopics').html("<h3>Well...that didn't work</h3>"))

