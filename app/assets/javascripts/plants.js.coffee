$(document).on "ready end.pjax", ->
  $(".datepicker").datepicker()
  
$ ->
  $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax]):not(.ui-state-default)').pjax('[data-pjax-container]')

