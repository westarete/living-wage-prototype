# For more information see: http://emberjs.com/guides/routing/

Lwc.Router.map ->
  @resource "states",
    path: "/states"

  @resource "state",
    path: "states/:state_id"

  @resource "counties", ->
    @resource "county",
      path: "/:county_id"
    return

  @resource "landscape",
    path: "/landscape"

  @resource "recalculate",
    path: "/recalculate"

  @resource "occupations",
    path: "/occupations"

  @resource "contribute",
    path: "/contribute"

  return
