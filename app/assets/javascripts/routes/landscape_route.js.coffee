# For more information see: http://emberjs.com/guides/routing/

Lwc.LandscapeRoute = Ember.Route.extend(model: ->
  @store.find "state"
)