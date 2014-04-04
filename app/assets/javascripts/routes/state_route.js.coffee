# For more information see: http://emberjs.com/guides/routing/

Lwc.StateRoute = Ember.Route.extend(model: (params) ->
	@store.find 'state', params.state_id
)
