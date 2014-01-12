class myMarketPrices.Views.GoodForm extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Good
  template: JST["backbone/templates/goods/form"]
  tagName: "form"
  className: "good_form"

  ui:
    name: "[name='name']"
    note: "[name='note']"

  events:
    "click #good_form__submit_button"    : "submit"
    "click #good_form__cancel_button"    : "cancel"

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
