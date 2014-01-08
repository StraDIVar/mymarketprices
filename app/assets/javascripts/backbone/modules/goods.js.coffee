myMarketPrices.module "Goods", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer (options) ->
    Mod.controller = new GoodsController(options)
    Mod.router = new Marionette.AppRouter
      controller: Mod.controller
      appRoutes:
        "goods"         : "index"
        "goods/new"     : "new"
        "good/:id/edit" : "edit"

  class GoodsController extends Backbone.Marionette.Controller
    constructor: (options) ->
      @content = App.content
      @collection = new App.Collections.Goods()

    index: =>
      @collection.fetch
        success: (collection) =>
          @content.show new App.Views.Goods(collection: collection)

    new: =>
      @content.show new App.Views.GoodForm(model: new App.Models.Good)

    edit: (id) =>
      @content.show new App.Views.GoodForm(model: @collection.get(id))
