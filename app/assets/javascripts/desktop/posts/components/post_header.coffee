
class PostHeader extends TaoComponent

  @tag: 'beast-post-header'

  @attribute 'afloat', type: 'boolean'

  _connected: ->
    $(window).on "scroll.post-header-#{@taoId}", (e) =>
      @afloat = $(document).scrollTop() > 0

  _disconnected: ->
    $(window).off ".post-header-#{@taoId}"
