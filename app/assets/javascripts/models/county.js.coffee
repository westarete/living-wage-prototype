# for more details see: http://emberjs.com/guides/models/defining-models/

Lwc.County = DS.Model.extend(
	countyname: DS.attr('string'),
	DS.belongsTo('state')
)
