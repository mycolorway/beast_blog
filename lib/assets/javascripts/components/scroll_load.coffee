
class ScrollLoad extends TaoComponent

  @tag: 'beast-scroll-load'

  @attribute 'url'

  @attribute 'loading', type: 'boolean'

  _connected: ->
    $(window).on "scroll.scroll-load-#{@taoId}", _.throttle (e) =>
      @_request() if !@loading && @_is_visible()
    , 100
    .scroll()

  _is_visible: ->
    $(document).scrollTop() > @jq.offset().top - $(window).height()

  _request: ->
    @loading = true

    $.ajax
      url: @url
      dataType: 'script'

TaoComponent.register ScrollLoad
