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

    submit = ->
      if textarea.val() is defaultText or textarea.val().length <= 5
        return false

    ready = ->
      form = $('#new_issue')
      textarea = form.find('textarea')
      defaultText = textarea.val()

      textarea.focus(focus)
      textarea.blur(blur)
      form.submit(submit)
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

    ajaxSwitchSort = (r, xhr) ->
      response = xhr.responseText
      issuesList.html(response)
      $(this).parents('#issues ul').children('li').removeClass('active')
      $(this).parent().addClass('active')

    # -*- expose public method -*- #
    ready: ->
      issuesList = $('#issues .list')
      issuesNav = $('#issues .nav')
      textarea = $('#new_issue textarea')
      $('#new_issue').bind 'ajax:complete', ajaxComplete

      issuesList.delegate '.agree a', 'ajax:complete', (r, xhr) ->
        response = $.parseJSON(xhr.responseText)
        $(this).parents('.vote').children('.count').html(response.vote_count)
        $(this).html('agreed!').parent().addClass('agreed')

      issuesNav.delegate('a', 'ajax:complete', ajaxSwitchSort)

  )(jQuery)

jQuery(document).ready ->
  MyCity.Home.AjaxForm.ready()
  MyCity.Home.Textarea.ready()
  false
