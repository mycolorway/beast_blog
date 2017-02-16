class CommentInput extends TaoComponent

  @tag: 'beast-comment-input'

  _init: ->
    super
    @_bind()

  _bind: ->
    @jq.find('textarea').on 'input', =>
      if @jq.find('textarea').val()
        @jq.find 'button'
          .removeAttr 'disabled'
      else
        @jq.find 'button'
          .attr 'disabled', true

  clear: ->
    @jq.find('textarea').val('')

TaoComponent.register CommentInput
