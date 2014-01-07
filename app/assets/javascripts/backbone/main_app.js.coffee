@myMarketPrices = new Backbone.Marionette.Application()

myMarketPrices.module 'Models'
myMarketPrices.module 'Collections'
myMarketPrices.module 'Views'
myMarketPrices.module 'Controllers'
myMarketPrices.module 'Routers'

myMarketPrices.addInitializer ->
  @.addRegions
    content: "#content"

myMarketPrices.on "initialize:after", ->
  Backbone.history.start(pushState: false) if Backbone.history?


$ ->
  myMarketPrices.start()
