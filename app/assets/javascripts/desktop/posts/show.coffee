class PostsShowPage extends TaoPage

  @tag 'posts-show-page'

  _init: ->
    super
    @commentForm = @jq.find('beast-comment-form').get(0)
    @commentList = @jq.find('beast-comment-list').get(0)

TaoPage.register PostsShowPage
