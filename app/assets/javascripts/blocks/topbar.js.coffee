class mmpApp.Topbar extends mmpApp.Block
  constructor: (options) ->
    super "topbar", options

    @._attachHandlers()

  # Privat Methods ------------------------------------------------------------------------------------------

  _attachHandlers: ->
    $(document)
      .on "click", "#{@._elSelector('menu_submenu')} > #{@._elSelector('menu_button_link')}", (event) =>
        $this = $(event.target)
        $switcher = $this.closest(@._elSelector("menu_submenu"))
        $switcher.toggleModifier(@._elClass("menu_submenu"), "active")
