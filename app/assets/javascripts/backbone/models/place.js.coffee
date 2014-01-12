class myMarketPrices.Models.Place extends Backbone.Model
  url: ->
    if @isNew()
      Routes.places_path()
    else
      Routes.plcae_path(@id)
