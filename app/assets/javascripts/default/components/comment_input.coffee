class CommentInput extends TaoComponent

  @tag: 'beast-comment-input'

  _init: ->
    super
    @_bind()

  _bind: ->
    el = $ @
    el.find('textarea').on 'input', =>
      if el.find('textarea').val()
        el.find 'button'
          .removeAttr 'disabled'
      else
        el.find 'button'
          .attr 'disabled', true

  clear: ->
    $(@).find('textarea').val('')

TaoComponent.register CommentInput
