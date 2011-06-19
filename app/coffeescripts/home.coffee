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

    issuesList = $('#issues .list')

    issuesList.delegate '.agree a', 'ajax:complete', (r, xhr) ->
      response = $.parseJSON(xhr.responseText)
      $(this).parent().parent().children('.count').html(response.vote_count)
      false

    $('#new_issue').bind 'ajax:complete', (r, xhr) ->
      response = xhr.responseText
      $('#issues .list').prepend(response)
      false

  $(document).ready(ready)
)(jQuery)


