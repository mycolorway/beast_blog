class PostsShowPage extends TaoPage

  @tag: 'posts-show-page'

  _init: ->
    super
    @commentInput = @jq.find('beast-comment-input').get(0)
    @commentList = @jq.find('beast-comment-list').get(0)

TaoPage.register PostsShowPage
