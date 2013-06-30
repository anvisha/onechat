
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
    console.log(party._id);
  }
  return partier_names;
};

Meteor.startup(function() {
  var NUM_OF_TILES, board, canvas, context, display, imageObj, partier_id, partiers, playerX, playerY, tiles, vHeight, vWidth, vX, vY, worldHeight, worldWidth;
  partier_id = Partiers.insert({
    username: null,
    x: null,
    y: null,
    video_stream: null
  });
  Session.set("partier_id", partier_id);
  partiers = Partiers.find().fetch();
  Meteor.setInterval(function() {
    if (Meteor.status().connected) {
      return Meteor.call('keepalive', Session.get('partier_id'));
    }
  }, 20 * 1000);
  canvas = void 0;
  context = void 0;
  imageObj = void 0;
  tiles = void 0;
  board = void 0;
  display = void 0;
  NUM_OF_TILES = 2;
  vX = 0;
  vY = 0;
  vWidth = 15;
  vHeight = 10;
  playerX = 0;
  playerY = 0;
  worldWidth = 29;
  worldHeight = 19;
  return $(document).ready(function() {
    var draw, loadedImagesCount, x, _results;
    draw = function() {
      var imgNum, theX, theY, x, y;
      context.clearRect(0, 0, canvas.width, canvas.height);
      y = 0;
      while (y <= vHeight) {
        x = 0;
        while (x <= vWidth) {
          theX = x * 32;
          theY = y * 32;
          imgNum = Math.floor(Math.random() * 3);
          context.drawImage(tiles[imgNum], theX, theY, 32, 32);
          x++;
        }
        y++;
      }
      context.fillStyle = "red";
      return context.fillRect((playerX - vX) * 32, (playerY - vY) * 32, 32, 32);
    };
    canvas = document.getElementById("canvas");
    context = canvas.getContext("2d");
    canvas.tabIndex = 0;
    canvas.focus();
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
      return draw();
    }), false);
    board = [];
    canvas.width = 512;
    canvas.height = 352;
    imageObj = new Image();
    tiles = [];
    loadedImagesCount = 0;
    x = 0;
    _results = [];
    while (x <= NUM_OF_TILES) {
      imageObj = new Image();
      imageObj.src = "/images/t" + x + ".png";
      imageObj.onload = function() {
        console.log("Added tile ... " + loadedImagesCount);
        loadedImagesCount++;
        if (loadedImagesCount === NUM_OF_TILES) {
          return draw();
        }
      };
      tiles.push(imageObj);
      _results.push(x++);
    }
    return _results;
  });
});
