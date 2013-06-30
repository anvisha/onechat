Meteor.methods keepalive: () ->
  Partiers.update
    $set:
      last_keepalive: (new Date()).getTime()
      idle: false


Meteor.setInterval (()->
    Partiers.remove
      update_time: 
        $lt: new Date()
    return
  ),
  20*1000