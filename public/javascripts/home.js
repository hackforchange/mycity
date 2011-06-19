/* DO NOT MODIFY. This file was compiled Sun, 19 Jun 2011 16:03:51 GMT from
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
        textarea.addClass('default-text');
      }
      return false;
    };
    ready = function() {
      textarea = $('#new_issue textarea');
      defaultText = textarea.val();
      textarea.focus(focus);
      textarea.blur(blur);
      return textarea.addClass('default-text');
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
        $('#new_issue').bind('ajax:complete', ajaxComplete);
        return issuesList.delegate('.agree a', 'ajax:complete', function(r, xhr) {
          var response;
          response = $.parseJSON(xhr.responseText);
          $(this).parents('.vote').children('.count').html(response.vote_count);
          return $(this).html('agreed!').parent().addClass('agreed');
        });
      }
    };
  })(jQuery)
};
jQuery(document).ready(function() {
  MyCity.Home.AjaxForm.ready();
  MyCity.Home.Textarea.ready();
  return false;
});