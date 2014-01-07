myMarketPrices.module "Goods", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer (options) ->
    Mod.controller = new GoodsController(options)
    Mod.router = new Marionette.AppRouter
      controller: Mod.controller
      appRoutes:
        "goods"     : "index"

  class GoodsController extends Backbone.Marionette.Controller
    constructor: (options) ->
      @collection = new App.Collections.Goods()

    index: ->
      @collection.fetch
        success: (collection) ->
          App.content.show new App.Views.Goods(collection: collection)
