class TaoForm extends TaoComponent

  @tag: 'tao-form'

  _init: ->
    @submit = @jq.find('[type=submit]')
    @form = @jq.find '> form'
    @_bind()

  _bind: ->
    @form.on 'ajax:beforeSend', (e) =>
      @loading()
      @trigger 'beforeSubmit'
    @form.on 'ajax:success', (e) =>
      @restoreButton()
      @trigger 'success'
    @form.on 'blur', '.input', (e) =>
      @_clearError $(e.currentTarget)

  _clearError: ($input)->
    $input.find('.error').remove()

  loading: ->
    @submit.prop('disabled', true)

  restoreButton: ->
    @submit.prop('disabled', false)

TaoComponent.register TaoForm
window.TaoForm = Tao.Form = TaoForm
