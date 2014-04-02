# For more information see: http://emberjs.com/guides/routing/

Lwc.RecalculateRoute = Ember.Route.extend(model: ->
  @store.find "state"
)
