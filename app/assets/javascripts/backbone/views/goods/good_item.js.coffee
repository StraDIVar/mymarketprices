class myMarketPrices.Views.Good extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Good
  template: JST["backbone/templates/goods/item"]
  tagName: 'li'
  className: 'good'

  events:
    "click a.good__collapse_switcher"   : "toggleCollapsing"

  onRender: ->
    @$el.modify("good", "collapsed", on)

  toggleCollapsing: ->
    @$el.toggleModifier("good", "collapsed")
