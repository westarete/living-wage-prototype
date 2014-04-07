# http://emberjs.com/guides/models/using-the-store/

window.Lwc = Ember.Application.create({
	LOG_TRANSITIONS: true
})

Ember.Inflector.inflector.irregular "county", "counties"
Ember.Inflector.inflector.irregular "metro", "metros"


Lwc.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  adapter: 'Lwc.ApplicationAdapter'

Lwc.ApplicationAdapter = DS.RESTAdapter.extend()