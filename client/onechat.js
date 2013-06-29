Template.world.partier_id = function() {
	return Session.get('partier_id');
};

Template.world.partiers = function() {
	var partiers = Partiers.find().fetch();
	var partier_names = [];
	for(party in partiers){
		partier_names.push(party['_id']);
		console.log(party);
	}
	return partier_names;
};

Meteor.startup(function() {
	//when client opens
	var partier_id = Partiers.insert({'username': 'hi' ,
		'x': null,
		'y':null,
		'video_stream': null });
	Session.set('partier_id', partier_id);

	var partiers = Partiers.find().fetch();


});

