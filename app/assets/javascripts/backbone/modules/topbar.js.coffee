myMarketPrices.module "Topbar", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer (options) ->
    Mod.controller = new TopbarController(options)

  class TopbarController extends Backbone.Marionette.Controller
    constructor: (options) ->
      @topbar = App.topbar
      @.show(options)

    show: (data) ->
      @topbar.show new App.Views.Topbar(model: new Backbone.Model(data))
