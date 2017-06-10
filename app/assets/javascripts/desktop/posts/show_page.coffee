class PostsShowPage extends TaoPage

  @tag 'posts-show-page'

  _init: ->
    super
    @commentForm = @findComponent 'beast-comment-form'
    @commentList = @findComponent 'beast-comment-list'

TaoPage.register PostsShowPage
