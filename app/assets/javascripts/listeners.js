$(document).ready(function () {
  $(".data-panel").popover({
      'container': 'body',
      'placement': 'bottom',
      'trigger': 'hover',
      'html': true
  });

  $("[type=radio]").on("click", function(information) { 

    function createFriendNode(name){
      return(
          $( "<li>" + name + "</li>" )
      );
    }

    var buffer = [];

    var id = $(this).attr('value');

    $.getJSON("http://localhost:3000/states/" + id, function (result) {
      console.log(result.counties);
      var buffer = result.counties.map(function(d) {  return "<input type=\"radio\" name=\"geography\" value=\"" + d.countyfips + "\">" + "<a href=\"../counties/" + d.countyfips + "\">" + d.countyname + "</a><br />" });
      $("#counties").empty().append(function () {
        return buffer.join('');
      });

      var buffer = result.metros.map(function(d) {  return "<input type=\"radio\" name=\"geography\" value=\"" + d.cbsa + "\">" + "<a href=\"../metros/" + d.cbsa + "\">" + d.cbsa_name + "</a><br />" });
      $("#metros").empty().append(function () {
        return buffer.join('');
      });
    });
  });
});
