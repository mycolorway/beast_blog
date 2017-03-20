#= require simditor

class Editor extends TaoComponent

  @tag: 'beast-editor'

  _init: ->
    new Simditor
      textarea: $(@).find 'textarea'
      toolbarFloatOffset: 24
      defaultImage: '/simditor-default-image.png'

TaoComponent.register Editor
