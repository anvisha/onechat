Meteor.setInterval(function(){
  Partiers.remove({update_time: {$lt : new Date()}},{onlyOne:false})

}, 20*1000);