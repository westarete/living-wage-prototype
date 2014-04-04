# for more details see: http://emberjs.com/guides/models/defining-models/

Lwc.County = DS.Model.extend(
	DS.belongsTo('state')
)
