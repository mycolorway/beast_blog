class PostsShowPage extends TaoPage

  @tag: 'posts-show-page'

  _init: ->
    super

  addComment: (commentElement)->
    if (noComments = $(@).find('.no-comments')).length
      noComments.after commentElement
      noComments.remove()
    else
      $(@).find 'beast-comment:last'
        .after commentElement
    $(@).find 'beast-comment-input'
      .get(0)
      .clear()
    count = $(@).find '.comments .comments-count'
    count.text(1 + parseInt(count.text()))

  addComments: (commentElements)->
    $(@).find '.more-comments'
      .replaceWith commentElements

  noMoreComments: ->
    $moreButton = $(@).find '.more-comments a'
    $moreButton.text $moreButton.data('no-more')
      .replaceWith $moreButton.clone()

TaoPage.register PostsShowPage
