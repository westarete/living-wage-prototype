# for more details see: http://emberjs.com/guides/models/defining-models/

Lwc.State = DS.Model.extend(
	state_name: DS.attr('string'),
	aggregations: DS.hasMany('aggregation')
	metros: DS.hasMany('metro'),
	counties: DS.hasMany('county')
)
