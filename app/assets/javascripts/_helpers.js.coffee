#
# jQuery extends
# -----------------------------------------------------------------------------------------------------------

$.fn.extend
  # TODO: test, description
  modify: (mainClass, modifier, add) ->
      if arguments.length != 3
        throw new Error("ERROR :: $.fn.modify :: 3 arguments expected")
      else
        classWithModifier = "#{mainClass}--#{modifier}"
        if add
          @
            .filter(".#{mainClass}, [class^='#{mainClass}--']")
            .not(".#{classWithModifier}")
            .addClass(classWithModifier)
        else # remove
          @
            .filter(".#{classWithModifier}")
            .removeClass(classWithModifier)
            .addClass(mainClass) # for fix cases when element hasn't main class without modifier

        return @

  # TODO: test, description
  unmodify: (mainClass) ->
    if arguments.length != 1
      throw new Error("ERROR :: $.fn.unmodify :: 1 argument expected")
    else
      mainClassLength = mainClass.length
      @.removeClass (index, classes) ->
        classesWithModifiers = _.filter classes.split(" "), (value) ->
          value.slice(0, mainClassLength + 2) == "#{mainClass}--"
        classesWithModifiers.join(" ")

      return @

  # TODO: test, description
  disable: ->
    @.each (index, element) ->
      $element = $(element)
      if $element.is("input, textarea, select, option, optgroup, button, fieldset")
        $element.prop("disabled", true)

  # TODO: test, description
  enable: ->
    @.each (index, element) ->
      $element = $(element)
      if $element.is("input, textarea, select, option, optgroup, button, fieldset")
        $element.prop("disabled", false)

  # TODO: test, description
  classHasModifier: (mainClass, modifier = "") ->
    argumentsLength = arguments.length
    if argumentsLength != 1 && argumentsLength != 2
      throw new Error("ERROR :: $.fn.classHasModifier :: 1 or 2 arguments expected")
    else
      @.hasClass("#{mainClass}--#{modifier}")

  # TODO: test, description
  toggleModifier: (mainClass, modifier = "") ->
    argumentsLength = arguments.length
    if argumentsLength != 1 && argumentsLength != 2
      throw new Error("ERROR :: $.fn.toggleModifier :: 1 or 2 arguments expected")
    else
      @.modify(mainClass, modifier, !@.classHasModifier(mainClass, modifier))

  # TODO: test, description
  cssHide: (hiddenClass = "hidden") ->
    @.addClass(hiddenClass)

  # TODO: test, description
  cssShow: (hiddenClass = "hidden") ->
    @.removeClass(hiddenClass)

  # TODO: test, description
  preloadBackgroundImage: ->
    src = @.css("backgroundImage")
    length = src.length - 7
    if length > 0
      src = src.substr(5, length)
      image = $("<img>")
      image.css
        position: "absolute"
        left: "-9999px"
        top: "-9999px"
        width: "1px"
        height: "1px"
      image.attr("src", src)
      image.on "load", ->
        image.remove()
      image.appendTo("body")

  EMPTY_HREF: "javascript:void(0);"

#
# Underscore extends
# -----------------------------------------------------------------------------------------------------------

_.mixin
  capitalize: (string) ->
    string.charAt(0).toUpperCase() + string.substring(1).toLowerCase()

