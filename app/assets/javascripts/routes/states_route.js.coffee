# For more information see: http://emberjs.com/guides/routing/

Lwc.StatesRoute = Ember.Route.extend(model: (params) ->
	@store.find 'state'
)
