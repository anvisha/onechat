Template.world.partier_id = ->
  Session.get "partier_id"

Template.world.partiers = ->
  partiers = Partiers.find().fetch()
  partier_names = []
  for party in partiers
    partier_names.push party._id
    console.log party._id
  partier_names

Meteor.startup ->
  
  #when client opens
  partier_id = Partiers.insert(
    username: null
    x: null
    y: null
    video_stream: null
  )
  Session.set "partier_id", partier_id
  partiers = Partiers.find().fetch()

  Meteor.setInterval(->
      if Meteor.status().connected 
        Meteor.call('keepalive', Session.get('partier_id'))
    , 20*1000)