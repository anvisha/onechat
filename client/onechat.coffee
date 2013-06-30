Template.world.partier_id = ->
  Session.get "partier_id"

Template.world.partiers = ->
  partiers = Partiers.find().fetch()
  partier_names = []
  for party of partiers
    partier_names.push party["_id"]
    console.log party
  partier_names

Meteor.startup ->
  # when client opens
  partier_id = Partiers.insert(
    username: "hi"
    x: null
    y: null
    video_stream: null
  )
  Session.set "partier_id", partier_id
  partiers = Partiers.find().fetch()

  # Viewport
  LoadMap = (map) ->
    [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0], [0, 1, 1, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0], [0, 1, 1, 2, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0], [0, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 0], [0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 0], [0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]  if map is 1
  canvas = undefined
  context = undefined
  board = undefined
  imageObj = undefined
  tiles = undefined
  board = undefined
  display = undefined
  NUM_OF_TILES = 2
  vX = 0
  vY = 0
  vWidth = 15
  vHeight = 10
  playerX = 0
  playerY = 0
  worldWidth = 29
  worldHeight = 19
  $(document).ready ->
    draw = ->
      context.clearRect 0, 0, canvas.width, canvas.height
      y = 0
      while y <= vHeight
        x = 0
        while x <= vWidth
          theX = x * 32
          theY = y * 32
          context.drawImage tiles[board[y + vY][x + vX]], theX, theY, 32, 32
          x++
        y++
      context.fillStyle = "red"
      context.fillRect (playerX - vX) * 32, (playerY - vY) * 32, 32, 32
    canvas = document.getElementById("canvas")
    context = canvas.getContext("2d")
    canvas.tabIndex = 0
    canvas.focus()
    canvas.addEventListener("keydown", ((e) ->
      console.log e
      key = null
      switch e.which
        when 37
          playerX-- if playerX > 0
        when 38
          playerY-- if playerY > 0
        when 39
          playerX++ if playerX < worldWidth
        when 40
          playerY++ if playerY < worldHeight
      vX = playerX - Math.floor(0.5 * vWidth)
      vX = 0 if vX < 0
      vX = worldWidth - vWidth if vX + vWidth > worldWidth
      vY = playerY - Math.floor(0.5 * vHeight)
      vY = 0 if vY < 0
      vY = worldHeight - vHeight if vY + vHeight > worldHeight
      draw()
    ), false)
    board = []
    canvas.width = 512
    canvas.height = 352
    board = LoadMap(1)
    imageObj = new Image()
    tiles = []
    loadedImagesCount = 0
    x = 0
    while x <= NUM_OF_TILES
      imageObj = new Image()
      imageObj.src = "/images/t"+x+".png"
      #imageObj.src = "http://mystikrpg.com/canvas/img/tiles/t" + x + ".png"
      imageObj.onload = ->
        loadedImagesCount++
        draw() if loadedImagesCount is NUM_OF_TILES
      tiles.push imageObj
      x++
