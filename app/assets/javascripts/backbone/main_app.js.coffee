@myMarketPrices = new Backbone.Marionette.Application()

myMarketPrices.module 'Models'
myMarketPrices.module 'Collections'
myMarketPrices.module 'Views'
myMarketPrices.module 'Controllers'
myMarketPrices.module 'Routers'

myMarketPrices.addInitializer ->
  @.addRegions
    toolbar: "#toolbar"
    content: "#content"

  @goodsCollection = new @Collections.Goods()
  @goodsCollection.fetch()
  @content.show new @Views.Goods(collection: @goodsCollection)

myMarketPrices.on "initialize:after", ->
  Backbone.history.start(pushState: true) if Backbone.history?


$ ->
  myMarketPrices.start()
