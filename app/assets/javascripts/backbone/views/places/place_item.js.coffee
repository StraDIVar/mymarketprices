class myMarketPrices.Views.Place extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Place
  template: JST["backbone/templates/places/item"]
  tagName: "li"
  className: "place"

  events:
    "click a.place__collapse_switcher"   : "toggleCollapsing"

  onRender: ->
    @$el.modify("place", "collapsed", on)

  toggleCollapsing: ->
    @$el.toggleModifier("place", "collapsed")
