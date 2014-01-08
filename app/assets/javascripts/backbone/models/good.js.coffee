class myMarketPrices.Models.Good extends Backbone.Model
  url: ->
    if @isNew()
      Routes.goods_path()
    else
      Routes.good_path(@id)
