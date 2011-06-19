# put jQuery into noConflict mode.
# To use $, closure your feature like so:
# MyCity.CoolFeature = (($) ->
#   # your code ...
# )(jQuery)
jQuery.noConflict()

MyCity = {}
