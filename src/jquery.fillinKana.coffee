# fillinKana - jQuery Plugin
# version: 0.0.1
# Licensed under the MIT license.
# Copyright 2015 fiv111
(($)->
  $.fn.fillinKana = (options)->
    opts = $.extend {}, {
      # Elements of the pre-conversion.
      from: ''
      # Elements after conversion
      to: []
      # milliseconds of refresh those target area.
      ms: 300

      # k2h: katakara to hirakana
      # h2k: hirakana to katakata
      # z2h: zenkaku to hankaku
      # h2z: hankaku to zenkaku
      conversionType: 'h2k'
    }, options

    fromElement = $ opts.from
    toElements  = opts.to
    isTyping    = false
    rawString   = ''

    # type of conversion
    convType = (->
      type = {}
      switch opts.conversionType
        when 'h2k'
          type =
            pattern: /[\u3041-\u3096]/g
            shiftValue: 0x60
        when 'k2h'
          type =
            pattern: /[\u30a1-\u30f6]/g
            shiftValue: - 0x60
        #when 'h2z'
        #  pattern: /[]/g
        #  shiftValue: 0xFEE0
        #when 'z2h'
        #   pattern: /[]/g
        #   shiftValue: - 0xFEE0
        else
          type =
            pattern: /[\u3041-\u3096]/g
            shiftValue: 0x60
      return type
    )()

    # convertInputValue
    convertInputValue = (e)->
      setTimeout (e)->
        rawVal = fromElement.val()

        $(toElements).each (i)->
          convVal = convTo(rawVal, convType)
          if $(@).is("input[type]")
            $(@).val convVal
          else
            $(@).html convVal

        if isTyping
          convertInputValue(e)
      , opts.ms

    # convTo
    convTo = (str, kana)->
      return str.replace kana.pattern, (m)->
        return String.fromCharCode m.charCodeAt(0) + kana.shiftValue

    # main
    (->
      # focus event
      fromElement.on 'focus', (e)->
        isTyping = true
        convertInputValue(e)

      # blur event
      fromElement.on 'blur', (e)->
        isTyping = false
    )()
)(jQuery)
