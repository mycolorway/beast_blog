
class PostAutosave extends TaoComponent

  @tag 'beast-post-autosave'

  @attribute 'url'

  @attribute 'valueFieldSelector', 'valueFieldTraversal'

  @attribute 'interval', default: 120

  @attribute 'lastSaveTime', observe: true

  _connected: ->
    @valueField = if @valueFieldSelector && @valueFieldTraversal
      @jq[@valueFieldTraversal] @valueFieldSelector
    else if @valueFieldSelector
      $ @valueFieldSelector

    @_startInterval()

  _disconnected: ->
    @_stopInterval()

  _renderSaveTime: ->
    return unless @lastSaveTime
    time = moment @lastSaveTime
    @jq.find('.time').text time.fromNow()

  _lastSaveTimeChanged: ->
    @_renderSaveTime()

  _startInterval: ->
    @_lastSavedValue = @valueField.val()
    @_saveTimer = setInterval =>
      @_save()
    , @interval * 1000

    @_refreshTimer = setInterval =>
      @_renderSaveTime()
    , 45000

  _stopInterval: ->
    clearInterval @_saveTimer
    clearInterval @_refreshTimer

  _save: ->
    value = @valueField.val()
    return if value == @_lastSavedValue

    $form = @valueField.closest('form')
    if $form.length > 0
      $.ajax
        url: @url
        dataType: 'script'
        type: 'post'
        data: $form.serialize()

      @_lastSavedValue = value

TaoComponent.register PostAutosave
