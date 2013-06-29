Template.world.partier_id = ->
  Session.get "partier_id"

Template.world.partiers = ->
  partiers = Partiers.find().fetch()
  partier_names = []
  for party of partiers
    partier_names.push party.username
  partier_names

Meteor.startup ->
  
  #when client opens
  partier_id = Partiers.insert(
    username: "hi"
    x: null
    y: null
    video_stream: null
  )
  Session.set "partier_id", partier_id
  partiers = Partiers.find().fetch()
