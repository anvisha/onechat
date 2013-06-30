
Template.world.partier_id = function() {
  return Session.get("partier_id");
};

Template.world.partiers = function() {
  var partier_names, partiers, party, _i, _len;
  partiers = Partiers.find().fetch();
  partier_names = [];
  for (_i = 0, _len = partiers.length; _i < _len; _i++) {
    party = partiers[_i];
    partier_names.push(party._id);
  }
  return partier_names;
};

Meteor.startup(function() {
  var NUM_OF_TILES, board, canvas, context, display, imageObj, partier_id, partiers, playerX, playerY, vHeight, vWidth, vX, vY, worldHeight, worldWidth;
  partier_id = Partiers.insert({
    username: null,
    x: null,
    y: null,
    video_stream: null,
    update_time: null
  });
  Session.set("partier_id", partier_id);

  var now = new Date();

  Meteor.setInterval(function(){
    Partiers.update({_id: partier_id}, {$set: {update_time: new Date()}});

  vX = 0;
  vY = 0;
  huh = 32;
  vWidth = document.width / (2*huh);
  vHeight = document.height / (2*huh);
  playerX = 0;
  playerY = 0;
  worldWidth = document.width;
  worldHeight = document.height;
  $(document).ready(function() {
    function draw() {
      var imgNum, theX, theY, x, y;
      context.clearRect(0, 0, canvas.width, canvas.height);
      context.fillStyle = "red";
      context.fillRect((playerX - vX) * huh, (playerY - vY) * huh, huh, huh);
    };
    canvas = document.getElementById("canvas");
    context = canvas.getContext("2d");
    canvas.tabIndex = 0;
    canvas.focus();
    canvas.width = document.width;
    canvas.height= document.height;
    canvas.addEventListener("keydown", (function(e) {
      var key;
      console.log(e);
      key = null;
      switch (e.which) {
        case 37:
          if (playerX > 0) {
            playerX--;
          }
          break;
        case 38:
          if (playerY > 0) {
            playerY--;
          }
          break;
        case 39:
          if (playerX < worldWidth) {
            playerX++;
          }
          break;
        case 40:
          if (playerY < worldHeight) {
            playerY++;
          }
      }
      vX = playerX - Math.floor(0.5 * vWidth);
      if (vX < 0) {
        vX = 0;
      }
      if (vX + vWidth > worldWidth) {
        vX = worldWidth - vWidth;
      }
      vY = playerY - Math.floor(0.5 * vHeight);
      if (vY < 0) {
        vY = 0;
      }
      if (vY + vHeight > worldHeight) {
        vY = worldHeight - vHeight;
      }
      draw();
    }), false);
    draw();
  });
});
