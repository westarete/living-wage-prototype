# for more details see: http://emberjs.com/guides/models/defining-models/

Lwc.State = DS.Model.extend(
	state_name: DS.attr('string'),
	aggregations: DS.hasMany 'aggregation',
		async: true,
	# metros: DS.hasMany 'metro',
	# 	async: true,
	# counties: DS.hasMany 'county',
	# 	async: true,
)
