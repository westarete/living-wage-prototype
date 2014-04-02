# http://emberjs.com/guides/models/using-the-store/
window.Lwc = Ember.Application.create({
	LOG_TRANSITIONS: true
})



Lwc.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  adapter: 'Lwc.ApplicationAdapter'

Lwc.ApplicationAdapter = DS.RESTAdapter.extend(
  host: "states"
  # namespace: "states.json"
  suffix: ".json"
  pathForType: (type) ->
    @_super(type) + @get("suffix")
    return
)

Lwc.IndexView = EmberLeaflet.MapView.extend(
  center: L.latLng(40.713282, -74.006978)
  zoom: 18
  options:
    maxZoom: 19
    minZoom: 0
)

