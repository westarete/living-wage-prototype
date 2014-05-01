# For more information see: http://emberjs.com/guides/routing/

Lwc.Router.map ->
  @resource "landscape", ->
    @resource "states", ->
      @resource "state",
      	path: ":state_id", ->

          @resource "metros", ->
            @resource "metro",
              path: ":metro_id"

          @resource "counties", ->
            @resource "county",
              path: ":county_id"

    return

  @resource "recalculate",
    path: "/recalculate"

  @resource "occupations",
    path: "/occupations"

  @resource "contribute",
    path: "/contribute"

  return