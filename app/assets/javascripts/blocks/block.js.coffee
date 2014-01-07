# require:
# jQuery

#############################################################################################################
# For create own class:
# class MyBlock extends Block
#   constructor: (options) ->
#     super "block_class_name", options
#
# For instance:
# myBlock = new MyBlock()
# or
# myBlock = new MyBlock(unique: true)
#############################################################################################################

class mmpApp.Block
  constructor: (mainClass, @options = {}) ->
    @ui = {}
    @ui.MAIN_CLASS = mainClass
    @ui.MAIN_SELECTOR = "#{if @options.unique then '#' else '.'}#{mainClass}"

  # Privat methods ------------------------------------------------------------------------------------------

  _elClass: (elName, modifier = null) ->
    modifierString = if modifier? then "--#{modifier}" else ""
    "#{@ui.MAIN_CLASS}__#{elName}#{modifierString}"

  _elSelector: (elName, modifierOrUnique = null) ->
    if typeof modifierOrUnique is 'boolean' && modifierOrUnique
      "##{@._elClass(elName)}"
    else if modifierOrUnique?
      ".#{@._elClass(elName, modifierOrUnique)}"
    else
      ".#{@._elClass(elName)}"

  # Public methods --------------------------------------------------------------------------------------------------

  $all: ->
    $(@ui.MAIN_SELECTOR)

  $self: ->
    if @options.unique
      $(@ui.MAIN_SELECTOR)
    else
      null

  $elements: (elementName) ->
    $(@._elSelector(elementName))
