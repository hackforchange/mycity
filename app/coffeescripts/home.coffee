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

    $('.agree a').bind 'ajax:complete', (r, xhr) ->
      response = $.parseJSON(xhr.responseText)
      $(this).parent().parent().children('.count').html(response.vote_count)
      false

  $(document).ready(ready)
)(jQuery)


