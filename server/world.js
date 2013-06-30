Meteor.setInterval(function(){
  Partiers.remove({update_time: {$lt : new Date()}})

}, 20*1000);