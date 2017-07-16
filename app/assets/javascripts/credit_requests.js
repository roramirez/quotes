poolingRequests = function(){
  var id = false;
  var last;
  window.setInterval(function(){
    console.log('im in')
    $.get( "/last", function(data) {
      if(id == false){
        id = data.id;
        last = data.id;
      }else {
        last = data.id;
        if (last != id){
          id = last;
          var path = 'credit_requests/' + id + '?call_now=1'
          $('a#link_to_request').attr('href', path)
          create_modal();
        }
      }
    })
    .fail(function() {
      console.log('pooling fallo');
    });
  }, 3000);
}

create_modal = function(){
  // Instantiate new modal
  var modal = new Custombox.modal({
    content: {
      effect: 'fadein',
      target: '#new_register_modal'
    }
  });

  // Open
  modal.open();
}
