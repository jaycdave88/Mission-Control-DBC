var HelpsPoller = function(delay, view) {
  this.delay = delay;
  this.currentTime = new Date();
  this.currentTime = this.currentTime.toJSON();
  this.view = view;
  this.count = 0;
}

HelpsPoller.prototype = {

  checkDatabase: function() {
    var that = this
    $.ajax("/users/"+this.user_id+"/recent/"+this.currentTime)
        .done(function(data){
          if(data.length > that.count){
            that.count = data.length
            that.view.update(that.count);
            that.view.updateDropdown(data);
            $("audio").get(0).play()
          }
        })
        .fail(function(){
          console.log("error");
        })
  },
  setUser: function(user_id){
    this.user_id = user_id;
  },
  start: function(){
    setInterval(this.checkDatabase.bind(this), this.delay)
  }

}

var NotificationView = function(){
  this.area = "#notifications"
  this.dropdown = "#hover1"
}

NotificationView.prototype = {

  update: function(value){
    $(this.area).find("a").text(value)
  },

  updateDropdown: function(data){
    $(this.dropdown).html('<li><a data-reveal-id="StickyModal" href="/stickies/'+data[0].sticky_id+'">'+data[0].title+'</a></li>');
    for (i = 1; i < data.length; i++){
      $(this.dropdown).append('<li><a data-reveal-id="StickyModal" href="/stickies/'+data[i].sticky_id+'">'+data[i].title+'</a></li>');
    }
  }

}
