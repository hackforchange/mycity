/* DO NOT MODIFY. This file was compiled Sun, 19 Jun 2011 06:44:05 GMT from
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
    return textarea.addClass('default-text');
  };
  return $(document).ready(ready);
})(jQuery);