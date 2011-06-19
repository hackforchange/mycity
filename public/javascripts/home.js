/* DO NOT MODIFY. This file was compiled Sun, 19 Jun 2011 12:18:50 GMT from
 * /home/jay/src/mycity/app/coffeescripts/home.coffee
 */

MyCity.Home = {
  Textarea: (function($) {
    var blur, defaultText, focus, ready, textarea;
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
        return textarea.addClass('default-text');
      }
    };
    ready = function() {
      var issuesList;
      textarea = $('#new_issue textarea');
      defaultText = textarea.val();
      textarea.focus(focus);
      textarea.blur(blur);
      textarea.addClass('default-text');
      issuesList = $('#issues .list');
      return issuesList.delegate('.agree a', 'ajax:complete', function(r, xhr) {
        var response;
        response = $.parseJSON(xhr.responseText);
        return $(this).parent().parent().children('.count').html(response.vote_count);
      });
    };
    return {
      ready: ready
    };
  })(jQuery),
  AjaxForm: (function($) {
    var ajaxComplete, issuesList, textarea;
    issuesList = void 0;
    textarea = void 0;
    ajaxComplete = function(r, xhr) {
      var response;
      response = xhr.responseText;
      issuesList.prepend(response);
      textarea.val('');
      return textarea.blur();
    };
    return {
      ready: function() {
        issuesList = $('#issues .list');
        textarea = $('#new_issue textarea');
        return $('#new_issue').bind('ajax:complete', ajaxComplete);
      }
    };
  })(jQuery)
};
jQuery(document).ready(function() {
  MyCity.Home.AjaxForm.ready();
  MyCity.Home.Textarea.ready();
  return false;
});