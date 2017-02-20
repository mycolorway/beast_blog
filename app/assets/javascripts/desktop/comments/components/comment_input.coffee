class CommentInput extends TaoComponent

  @tag: 'beast-comment-input'

  _init: ->
    super

    @form = @jq.find('.comment-form').get(0)
    @textarea = @jq.find('textarea')

    @_bind()

  _bind: ->
    @form.on 'beforeSubmit', (e) =>
      return false unless @textarea.val()

    @textarea.on 'input', _.throttle (e) =>
      @_resizeTextarea()
      @_refreshSubmitButton()
    , 100

  clear: ->
    @jq.find('textarea').val('')

  _resizeTextarea: ->
    @textarea.css 'height', 'auto'
    borderHeight = parseInt(@textarea.css('border-top-width')) + parseInt(@textarea.css('border-bottom-width'))
    scrollHeight = @textarea[0].scrollHeight + borderHeight
    @textarea.css 'height', scrollHeight

  _refreshSubmitButton: ->
    @form.jq.find('button').prop 'disabled', !@textarea.val()

TaoComponent.register CommentInput
