class PostsNewPage extends TaoPage

  @tag: 'posts-new-page'

  _init: ->
    super
    @bind()

  bind: ->
    $page = $(@)
    @publish = $page.find '.publish'
    @form = $page.find '.new_post'
    @publish.on 'click', =>
      return if @publish.is(':disabled')
      @form.submit()

    @form.on 'ajax:beforeSend', =>
      @publish.attr 'disabled', true

TaoPage.register PostsNewPage
