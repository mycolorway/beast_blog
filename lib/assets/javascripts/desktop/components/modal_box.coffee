class ModalBox extends TaoComponent

  @tag: 'beast-modal-box'

  _init: ->
    $(@).children().wrapAll('<div class="box"></div>')
    $(@).prepend('<div class="mask"></div>')
    @_bind()

  _bind: ->
    $(@).on 'click', '.mask', =>
      $(@).remove()

TaoComponent.register ModalBox
