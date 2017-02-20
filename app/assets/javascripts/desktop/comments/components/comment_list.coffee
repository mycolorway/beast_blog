class CommentList extends TaoComponent

  @tag: 'beast-comment-list'

  @attribute 'empty', type: 'boolean'

  _init: ->
    super
    @_bind()

  _bind: ->

  addComment: ($comment) ->
    $lastComment = @jq.find('.comment:last')
    if $lastComment.length > 0
      $lastComment.after $comment
    else
      @jq.append $comment

  removeComment: (selector) ->
    @jq.find(selector).fadeOut ->
      $(@).remove()

  updateCommentCount: (count) ->
    @jq.find('h3 .count').text count
    @empty = count == 0

  moreComments: ($comments) ->
    @jq.find('.more-comments').replaceWith $comments

TaoComponent.register CommentList
