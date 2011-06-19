MyCity.Home =
  Textarea: (($) ->
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

      false

    ready = ->
      textarea = $('#new_issue textarea')
      defaultText = textarea.val()

      textarea.focus(focus)
      textarea.blur(blur)
      textarea.addClass('default-text')

    # -*- expose public method -*- #
    ready: ready
  )(jQuery)

  AjaxForm: (($) ->
    issuesList = undefined
    textarea = undefined

    ajaxComplete = (r, xhr) ->
      response = xhr.responseText
      issuesList.prepend(response)
      textarea.val('')
      textarea.blur()

    # -*- expose public method -*- #
    ready: ->
      issuesList = $('#issues .list')
      textarea = $('#new_issue textarea')
      $('#new_issue').bind 'ajax:complete', ajaxComplete

      issuesList.delegate '.agree a', 'ajax:complete', (r, xhr) ->
        response = $.parseJSON(xhr.responseText)
        $(this).parent().parent().children('.count').html(response.vote_count)

  )(jQuery)

jQuery(document).ready ->
  MyCity.Home.AjaxForm.ready()
  MyCity.Home.Textarea.ready()
  false
