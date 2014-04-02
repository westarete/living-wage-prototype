# For more information see: http://emberjs.com/guides/routing/

Lwc.ContributeRoute = Ember.Route.extend(model: ->
  @store.find "state"
)