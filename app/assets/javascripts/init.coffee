$("document").ready ->
  $("html").on "dragover", (event) ->
    event.preventDefault()
    event.stopPropagation()
    $(this).addClass('dragging')

  $("html").on "dragleave", (event) ->
    event.preventDefault()
    event.stopPropagation()
    $(this).removeClass('dragging')

  $("html").on "drop", (event) ->
    event.preventDefault()
    event.stopPropagation()
