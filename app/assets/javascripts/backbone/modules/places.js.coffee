myMarketPrices.module "Places", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer (options) ->
    Mod.controller = new PlacesController(options)
    Mod.router = new Marionette.AppRouter
      controller: Mod.controller
      appRoutes:
        "places"             : "index"
        "places/new"         : "new"
        "place/:id/edit"     : "edit"
        "place/:id/delete"   : "delete"

  class PlacesController extends Backbone.Marionette.Controller
    constructor: (options) ->
      @content = App.content
      @collection = new App.Collections.Places()

    index: =>
      @collection.fetch
        success: (collection) =>
          @content.show new App.Views.Places(collection: collection)

    new: =>
      @content.show new App.Views.PlaceForm(model: new App.Models.Place)

    edit: (id) =>
      @content.show new App.Views.PlaceForm(model: @collection.get(id))

    delete: (id) =>
      @collection.get(id).destroy()
      Backbone.history.navigate("places", replace: true)
