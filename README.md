# jquery.fillinKana
Convert kana for input text and binding the input value which is converted.

## How to use

insert the script in the footer.

```javascript
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="jquery.fillinKana.min.js" type="text/javascript"></script>
  <script>
    $("#textField").fillinKana({
      from: $('#element1')
      to: [$('p'), $('input[type="input"]')],
      ms: 300,
      conversionType: 'h2k'
    });
  </script>
```

### Default Setting
```javascript
    // Elements of the pre-conversion.
    from: ''

    // Elements after conversion
    to: []

    // milliseconds of refresh those target area.
    ms: 300

    // k2h: katakara to hirakana
    // h2k: hirakana to katakata
    conversionType: 'h2k'
```
