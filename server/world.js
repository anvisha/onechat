Meteor.methods({
  keepalive: function(player_id) {
    check(player_id, String);
    return Players.update({
      _id: player_id
    }, {
      $set: {
        last_keepalive: (new Date()).getTime(),
        idle: false
      }
    });
  }
});

Meteor.setInterval((function() {
  var idle_threshold, now, remove_threshold;
  now = (new Date()).getTime();
  idle_threshold = now - 70 * 1000;
  remove_threshold = now - 60 * 1000;
  return Players.update({
    last_keepalive: {
      $lt: idle_threshold
    }
  }, {
    $set: {
      idle: true
    }
  });
}), 30 * 1000);