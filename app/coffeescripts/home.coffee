(($) ->
  # -*- private attributes -*- #
  textarea = undefined
  defaultText = undefined

  # -*- private functions -*- #
  focus = ->
    if textarea.val() is defaultText
      textarea.val('')
      textarea.removeClass('default-text')
  blur =  ->
    if textarea.val() is ''
      textarea.val(defaultText)
      textarea.addClass('default-text')

  ready = ->
    textarea = $('#new_issue textarea')
    defaultText = textarea.val()

    textarea.focus(focus)
    textarea.blur(blur)
    textarea.addClass('default-text')

  $(document).ready(ready)
)(jQuery)
