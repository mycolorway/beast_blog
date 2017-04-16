#= require tao
#= require tao/ui
#= require tao/ui/icons/beast
#= require action_cable
#= require moment
#= require moment/zh-cn
#= require_self
#= require_tree ./channels

class Application extends TaoApplication

  _init: ->
    super
    @cable = ActionCable.createConsumer()

  _initI18n: ->
    super
    if moment? && @locale
      moment.locale @locale.toLowerCase()

window.Application = Application
