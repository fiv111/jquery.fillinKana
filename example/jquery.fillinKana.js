// fillinKana - jQuery Plugin
// version: 0.0.1
// Licensed under the MIT license.
// Copyright 2015 fiv111
(function($) {
  return $.fn.fillinKana = function(options) {
    var convTo, convType, convertInputValue, fromElement, isTyping, opts, rawString, toElements;
    opts = $.extend({}, {
      from: '',
      to: [],
      ms: 300,
      conversionType: 'h2k'
    }, options);
    fromElement = $(opts.from);
    toElements = opts.to;
    isTyping = false;
    rawString = '';
    convType = (function() {
      var type;
      type = {};
      switch (opts.conversionType) {
        case 'h2k':
          type = {
            pattern: /[\u3041-\u3096]/g,
            shiftValue: 0x60
          };
          break;
        case 'k2h':
          type = {
            pattern: /[\u30a1-\u30f6]/g,
            shiftValue: -0x60
          };
          break;
        default:
          type = {
            pattern: /[\u3041-\u3096]/g,
            shiftValue: 0x60
          };
      }
      return type;
    })();
    convertInputValue = function(e) {
      return setTimeout(function(e) {
        var rawVal;
        rawVal = fromElement.val();
        $(toElements).each(function(i) {
          var convVal;
          convVal = convTo(rawVal, convType);
          if ($(this).is("input[type]")) {
            return $(this).val(convVal);
          } else {
            return $(this).html(convVal);
          }
        });
        if (isTyping) {
          return convertInputValue(e);
        }
      }, opts.ms);
    };
    convTo = function(str, kana) {
      return str.replace(kana.pattern, function(m) {
        return String.fromCharCode(m.charCodeAt(0) + kana.shiftValue);
      });
    };
    return (function() {
      fromElement.on('focus', function(e) {
        isTyping = true;
        return convertInputValue(e);
      });
      return fromElement.on('blur', function(e) {
        return isTyping = false;
      });
    })();
  };
})(jQuery);
