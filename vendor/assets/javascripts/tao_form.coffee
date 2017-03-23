class TaoForm extends TaoComponent

  @tag 'tao-form'

  _connected: ->
    @submit = @jq.find('[type=submit]')
    @form = @jq.find '> form'
    @_bind()

  _bind: ->
    @form.on "ajax:beforeSend.tao-form-#{@taoId}", (e) =>
      @loading()
      @trigger 'beforeSubmit'
    @form.on "ajax:success.tao-form-#{@taoId}", (e) =>
      @restoreButton()
      @trigger 'success'
    @form.on "blur.tao-form-#{@taoId}", '.input', (e) =>
      @_clearError $(e.currentTarget)

  _disconnected: ->
    @form.off ".tao-form-#{@taoId}"
    @form = null
    @submit = null

  _clearError: ($input)->
    $input.find('.error').remove()

  loading: ->
    @submit.prop('disabled', true)

  restoreButton: ->
    @submit.prop('disabled', false)

TaoComponent.register TaoForm
window.TaoForm = Tao.Form = TaoForm
