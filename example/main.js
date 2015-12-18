jQuery(document).ready(function($) {
  return $("#textField").fillinKana({
    from: $('#textField'),
    to: [$('#resultP'), $('p.p'), $('p#p0'), $('p#p1'), $('p#p2'), $('div'), $('textarea')],
    ms: 300,
    conversionType: 'h2k'
  });
});
