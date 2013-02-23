# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#search_county_id').parent().hide()
  $('#search_city_code').parent().hide()
  counties = $('#search_county_id').html()
  cities = $('#search_city_code').html()
  console.log(counties)

  $('#search_state_id').change ->
  	console.log(counties)
  	state = $('#search_state_id :selected').text()
  	options = $(counties).filter("optgroup[label='#{state}']").html()
  	if options
  		$('#search_county_id').html(options)
  		$('#search_county_id').parent().show()
  		county = $('#search_county_id :selected').text()
  		city_options = $(cities).filter("optgroup[label='#{county}']").html()
  		console.log(county)
	  	if city_options
	  		$('#search_city_code').html(city_options)
	  		$('#search_city_code').parent().show()
	  	else
	  		$('#search_city_code').empty()
	  		$('#search_city_code').parent().hide()
	  	$('#search_county_id').change ->
	  		county = $('#search_county_id :selected').text()
	  		city_options = $(cities).filter("optgroup[label='#{county}']").html()
	  		if city_options
	  			$('#search_city_code').html(city_options)
	  			$('#search_city_code').parent().show()
	  		else
	  			$('#search_city_code').empty()
	  			$('#search_city_code').parent().hide()
  	else
  		$('#search_county_id').empty()
  		$('#search_county_id').parent().hide()

