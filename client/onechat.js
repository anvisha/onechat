Template.world.partier_id = function() {
	return Session.get('partier_id');
}

Meteor.startup(function() {
	//when client opens
	var partier_id = Partiers.insert({'username': null ,
		'x': null,
		'y':null,
		'video_stream': null });
	Session.set('partier_id', partier_id);

});

