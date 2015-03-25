$(document).ready(function(){

  $(document).foundation();

  $("a[href='/users/new']").on("click", function(){
  $.ajax("/users/new").done(function(data){
       $("#SignupModal").html(data);
     });
  })

  $("#sticky-list, #hover1").on("click", function(e){
    e.preventDefault();
  $.ajax(e.target.href).done(function(data){
       $("#StickyModal").html(data);
     });
  })

  $.ajax("/sessions/status")
      .done(function(data){
        if (data.logged){
          poller = new HelpsPoller(5000, new NotificationView());
          poller.setUser(data.user_id);
          poller.start();
        }
      })

  var removeNotice = function(){
    $("#flash").fadeOut(400, function(){$(this).remove()});
  }

  setTimeout(removeNotice,4000);
})
