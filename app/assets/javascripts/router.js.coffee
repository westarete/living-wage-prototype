# For more information see: http://emberjs.com/guides/routing/

Lwc.Router.map ->
  @resource "states", ->
    @resource "state",
      path: "/:state_id"

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
