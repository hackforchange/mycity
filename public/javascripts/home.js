/* DO NOT MODIFY. This file was compiled Sun, 19 Jun 2011 11:28:55 GMT from
 * /Users/phill/Projects/mycity/app/coffeescripts/home.coffee
 */

(function($) {
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
    textarea = $('#new_issue textarea');
    defaultText = textarea.val();
    textarea.focus(focus);
    textarea.blur(blur);
    textarea.addClass('default-text');
    $('.agree a').bind('ajax:complete', function(r, xhr) {
      var response;
      response = $.parseJSON(xhr.responseText);
      $(this).parent().parent().children('.count').html(response.vote_count);
      return false;
    });
    return $('#new_issue').bind('ajax:complete', function(r, xhr) {
      var response;
      response = xhr.responseText;
      $('#issues .list').prepend(response);
      return false;
    });
  };
  return $(document).ready(ready);
})(jQuery);