$(document).ready(function () {
  $(".data-panel").popover({
      'container': 'body',
      'placement': 'bottom',
      'trigger': 'hover',
      'html': true
  });

  $("[type=radio]").on("click", function(information) { 

    var id = $(this).attr('value');

    $.getJSON("http://localhost:3000/states/" + id, "test", function (result) {
      console.log(result);
      $("#counties").empty().append(function () {
        return "test";
      });
    });
  });
});
