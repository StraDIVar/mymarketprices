class myMarketPrices.Views.Good extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Good
  template: JST["backbone/templates/goods/item"]
  tagName: 'li'
  className: 'good'