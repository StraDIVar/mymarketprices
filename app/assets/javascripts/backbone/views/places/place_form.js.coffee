class myMarketPrices.Views.PlaceForm extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Place
  template: JST["backbone/templates/places/form"]
  tagName: "form"
  className: "place_form"

  ui:
    name: "[name='name']"
    note: "[name='note']"

  events:
    "click #place_form__submit_button"    : "submit"
    "click #place_form__cancel_button"    : "cancel"

  submit: ->
    @model.set
      name: @ui.name.val()
      note: @ui.note.val()

    if @model.isNew()
      @.create()
    else
      @.update()

  create: ->
    @model.save
      success: (model) =>
        @model = model

  update: ->
    @model.save()

  cancel: ->
    if Backbone.history.history.length > 1
      Backbone.history.history.back()
    else
      Backbone.history.navigate("/")
