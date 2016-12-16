class Form extends TaoComponent

  @tag: 'beast-form'

  _init: ->
    @submit = $(@).find('[type=submit]')
    @form = $(@).find 'form'
    @_bind()

  _bind: ->
    @form.on 'ajax:beforeSend', => @loading()
    @form.on 'ajax:success', => @restoreButton()

  loading: ->
    @submit.prop('disabled', true)

  restoreButton: ->
    @submit.prop('disabled', false)

TaoComponent.register Form
