/* DO NOT MODIFY. This file was compiled Sun, 19 Jun 2011 18:14:57 GMT from
 * /home/jay/src/mycity/app/coffeescripts/home.coffee
 */

MyCity.Home = {
  Textarea: (function($) {
    var blur, defaultText, focus, ready, submit, textarea;
    textarea = void 0;
    defaultText = void 0;
    focus = function() {
      if (textarea.val() === defaultText) {
        textarea.val('');
        return textarea.removeClass('default-text');
      }
    };
    blur = function() {
      if (textarea.val() === '') {
        textarea.val(defaultText);
        textarea.addClass('default-text');
      }
      return false;
    };
    submit = function() {
      console.log('val', textarea.val());
      console.log('length', textarea.val().length);
      if (textarea.val() === defaultText || textarea.val().length <= 5) {
        return false;
      }
    };
    ready = function() {
      var form;
      form = $('#new_issue');
      textarea = form.find('textarea');
      defaultText = textarea.val();
      textarea.focus(focus);
      textarea.blur(blur);
      form.submit(submit);
      return textarea.addClass('default-text');
    };
    return {
      ready: ready
    };
  })(jQuery),
  AjaxForm: (function($) {
    var ajaxComplete, ajaxSwitchSort, issuesList, textarea;
    issuesList = void 0;
    textarea = void 0;
    ajaxComplete = function(r, xhr) {
      var response;
      response = xhr.responseText;
      issuesList.prepend(response);
      textarea.val('');
      return textarea.blur();
    };
    ajaxSwitchSort = function(r, xhr) {
      var response;
      response = xhr.responseText;
      issuesList.html(response);
      $(this).parents('#issues ul').children('li').removeClass('active');
      return $(this).parent().addClass('active');
    };
    return {
      ready: function() {
        var issuesNav;
        issuesList = $('#issues .list');
        issuesNav = $('#issues .nav');
        textarea = $('#new_issue textarea');
        $('#new_issue').bind('ajax:complete', ajaxComplete);
        issuesList.delegate('.agree a', 'ajax:complete', function(r, xhr) {
          var response;
          response = $.parseJSON(xhr.responseText);
          $(this).parents('.vote').children('.count').html(response.vote_count);
          return $(this).html('agreed!').parent().addClass('agreed');
        });
        return issuesNav.delegate('a', 'ajax:complete', ajaxSwitchSort);
      }
    };
  })(jQuery)
};
jQuery(document).ready(function() {
  MyCity.Home.AjaxForm.ready();
  MyCity.Home.Textarea.ready();
  return false;
});