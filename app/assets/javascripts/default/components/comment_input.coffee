class CommentInput extends TaoComponent

  @tag: 'beast-comment-input'

  clear: ->
    $(@).find 'textarea'
      .val('')

TaoComponent.register CommentInput
