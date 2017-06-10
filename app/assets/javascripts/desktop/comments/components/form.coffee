class CommentForm extends Tao.Form.Element

  @tag 'beast-comment-form'

  _connected: ->
    @textarea = @jq.find('textarea')
    super

  _bind: ->
    super
    @on 'beforeSubmit', (e) =>
      return false unless @textarea.val()

    @textarea.on "input.comment-form-#{@taoId}", _.throttle (e) =>
      @_resizeTextarea()
      @_refreshSubmitButton()
    , 100

  _disconnected: ->
    super
    @textarea.off ".comment-form-#{@taoId}"
    @textarea = null

  clear: ->
    @textarea.val ''
    @_refreshSubmitButton()

  _resizeTextarea: ->
    @textarea.css 'height', 'auto'
    borderHeight = parseInt(@textarea.css('border-top-width')) + parseInt(@textarea.css('border-bottom-width'))
    scrollHeight = @textarea[0].scrollHeight + borderHeight
    @textarea.css 'height', scrollHeight

  _refreshSubmitButton: ->
    @jq.find('button').prop 'disabled', !@textarea.val()

TaoComponent.register CommentForm
