class myMarketPrices.Views.GoodForm extends Backbone.Marionette.ItemView
  model: myMarketPrices.Models.Good
  template: JST["backbone/templates/goods/form"]
  tagName: 'form'
  className: 'good_form'

  ui:
    name: "[name='name']"
    note: "[name='note']"
    submitButton: "#good_form__submit_button"
    cancelButton: "#good_form__cancel_button"

  events:
    "click #good_form__submit_button"    : "submit"

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
