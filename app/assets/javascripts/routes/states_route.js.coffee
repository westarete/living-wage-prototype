# For more information see: http://emberjs.com/guides/routing/

Lwc.StatesRoute = Ember.Route.extend(model: ->
  @store.find "state"
)