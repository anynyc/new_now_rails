$(function() {

  console.log("main js loaded")

  $("body").on("click", "#month-down", function(e){
    e.preventDefault();
    var month = $(this).data("month")
    var year = $(this).data("year")

    $.ajax({
      url: '/admin/month_down',
      dataType: 'script',
      data: {month: month, year: year}
    });
  });



  $("body").on("click", "#month-up", function(e){
    e.preventDefault();
    var month = $(this).data("month")
    var year = $(this).data("year")

    $.ajax({
      url: '/admin/month_up',
      dataType: 'script',
      data: {month: month, year: year},

      // success: function(response) {
      //   debugger
      // }
    });
  });


});
