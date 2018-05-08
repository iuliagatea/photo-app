$(document).on('turbolinks:load',function(){
  $('#friends-lookup-form').on('ajax:complete', function(event, data, status){
    $('#results').html(data.responseText)
  })
})