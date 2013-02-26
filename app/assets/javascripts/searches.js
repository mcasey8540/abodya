$(function() {
    $( "#slider-range" ).slider({
      animate: "fast", 
      range: true,
      min: 0,
      step: 10000,
      max: 2000000,
      values: [ 250000, 600000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
    
      var values = $( "#slider-range" ).slider( "values" );
      $("#search_max_price").val(values[1]);
      $("#search_min_price").val(values[0]);


    $( "#slider-range" ).on( "slidechange", function( event, ui ) {
      var values = $( "#slider-range" ).slider( "values" );
      $("#search_max_price").val(values[1]);
      $("#search_min_price").val(values[0]);
      console.log(values);
    } );

    $( "#slider-range-sq-ft" ).slider({
      animate: "fast", 
      min: 0,
      range: false,
      step: 500,
      max: 10000,
      value: 2500,
      slide: function( event, ui ) {
        $( "#amount_square_feet" ).val( ui.value + " square feet");
      }
    });
    $( "#amount_square_feet" ).val( $( "#slider-range-sq-ft" ).slider( "value" ) +
      " square feet" );
    
      var min_sq_ft_value = $( "#slider-range-sq-ft" ).slider( "value" );
      $("#search_min_sq_ft").val(min_sq_ft_value);

    $( "#slider-range-sq-ft" ).on( "slidechange", function( event, ui ) {
      var min_sq_ft_value = $( "#slider-range-sq-ft" ).slider( "value" );
      $("#search_min_sq_ft").val(min_sq_ft_value);
      console.log(min_sq_ft_value);
    } );

    $( "#slider-range-max-tax" ).slider({
      animate: "fast", 
      min: 0,
      range: false,
      step: 1000,
      max: 50000,
      value: 6500,
      slide: function( event, ui ) {
        $( "#amount_max_tax" ).val( "$" +ui.value);
      }
    });
    $( "#amount_max_tax" ).val( "$"+ $( "#slider-range-max-tax" ).slider( "value" ));
    
      var max_taxes = $( "#slider-range-max-tax" ).slider( "value" );
      $("#search_max_taxes").val(max_taxes);

    $( "#slider-range-max-tax" ).on( "slidechange", function( event, ui ) {
      var max_taxes = $( "#slider-range-max-tax" ).slider( "value" );
      $("#search_max_taxes").val(max_taxes);
      console.log(max_taxes);
    } );

});
