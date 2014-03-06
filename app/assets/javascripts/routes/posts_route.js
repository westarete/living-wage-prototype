EmberTester.PostsRoute = Ember.Route.extend({
  model: function() {
    EmberTester.State.find();
  }
});
