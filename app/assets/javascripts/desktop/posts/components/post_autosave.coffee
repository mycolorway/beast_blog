
class PostAutosave extends TaoComponent

  @tag: 'beast-posst-autosave'

  @attribute 'url'

  @attribute 'valueFieldSelector', 'valueFieldTraversal'

  @attribute 'interval', default: 120

  @attribute 'lastSaveTime'

  _connected: ->
    @valueField = if @valueFieldSelector && @valueFieldTraversal
      @jq[@valueFieldTraversal] @valueFieldSelector
    else if @valueFieldSelector
      $ @valueFieldSelector

    @_lastSaveTimeChanged()
    @_startInterval()

  _disconnected: ->
    @_stopInterval()

  _renderSaveTime: (timeString) ->
    return unless timeString
    time = moment timeString
    @jq.find('.time').text time.fromNow()

  _lastSaveTimeChanged: ->
    @_renderSaveTime @lastSaveTime

  _startInterval: ->
    @_lastSavedValue = @valueField.val()
    @_timer = setInterval =>
      @_save()
    , @interval * 1000

  _stopInterval: ->
    clearInterval @_timer

  _save: ->
    value = @valueField.val()
    return if value == @_lastSavedValue

    $form = @valueField.closest('form')
    if $form.length > 0
      $.ajax
        url: @url
        dataType: 'script'
        type: 'post'
        data: $form.serialize() #.replace("&_method=patch")

      @_lastSavedValue = value

TaoComponent.register PostAutosave
