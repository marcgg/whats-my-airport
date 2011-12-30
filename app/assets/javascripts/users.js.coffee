# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

hasPlaceholderSupport = () ->
  input = document.createElement('input')
  ('placeholder' in input)

jQuery(document).ready ->

  # Home placeholder
  if !hasPlaceholderSupport()
    jQuery('#user_name')
      .val(jQuery('#user_name').attr('placeholder'))
      .focus ->
        jQuery(this).val('') if jQuery(this).val() == jQuery(this).attr('placeholder')
      .blur ->
        jQuery(this).val(jQuery(this).attr('placeholder')) if jQuery(this).val() == ''

  # Blank search handling
  jQuery('form').submit ->
    user_name = jQuery.trim(jQuery('#user_name').val())
    user_name != jQuery('#user_name').attr('placeholder') && user_name != ''

  # Google Maps
  if jQuery('#map').length > 0
    initialize()

# Google Maps initialization
initialize = () ->
  latlng = new google.maps.LatLng latitude, longitude
  options =
    zoom: 12
    center: latlng
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map document.getElementById("map"), options

  marker = new google.maps.Marker 
    position: latlng
    map: map
