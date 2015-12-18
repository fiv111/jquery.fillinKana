# fillinKana - jQuery Plugin
# version: 0.0.1
# Licensed under the MIT license.
# Copyright 2015 fiv111
jQuery(document).ready ($)->
  $("#textField").fillinKana
    from: $ '#textField'
    to: [$('#resultP'), $('p.p'), $('p#p0'), $('p#p1'), $('p#p2'), $('div'), $('textarea')]
    ms: 300
    conversionType: 'h2k'
