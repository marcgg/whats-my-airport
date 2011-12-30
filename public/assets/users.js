(function() {
  var hasPlaceholderSupport, initialize,
    __indexOf = Array.prototype.indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  hasPlaceholderSupport = function() {
    var input;
    input = document.createElement('input');
    return __indexOf.call(input, 'placeholder') >= 0;
  };

  jQuery(document).ready(function() {
    if (!hasPlaceholderSupport()) {
      jQuery('#user_name').val(jQuery('#user_name').attr('placeholder')).focus(function() {
        if (jQuery(this).val() === jQuery(this).attr('placeholder')) {
          return jQuery(this).val('');
        }
      }).blur(function() {
        if (jQuery(this).val() === '') {
          return jQuery(this).val(jQuery(this).attr('placeholder'));
        }
      });
    }
    jQuery('form').submit(function() {
      var user_name;
      user_name = jQuery.trim(jQuery('#user_name').val());
      return user_name !== jQuery('#user_name').attr('placeholder') && user_name !== '';
    });
    if (jQuery('#map').length > 0) return initialize();
  });

  initialize = function() {
    var latlng, map, marker, options;
    latlng = new google.maps.LatLng(latitude, longitude);
    options = {
      zoom: 12,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map"), options);
    return marker = new google.maps.Marker({
      position: latlng,
      map: map
    });
  };

}).call(this);
