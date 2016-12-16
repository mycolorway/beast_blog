class HeaderMenu extends TaoComponent

  @tag: 'beast-header-menu'

  @property 'active', observe: true

  _init: ->
    $(@).on 'click', 'a', =>
      @toggleActive()

  _activeChanged: ->
    $document = $ document
    $document.off 'mousedown.header-menu'

    if @active
      $document.on 'mousedown.header-menu', (e) =>
        return if $.contains(@, e.target)
        @active = false

  toggleActive: ->
    @active = !@active

  prepareCache: ->
    @active = false

TaoComponent.register HeaderMenu
