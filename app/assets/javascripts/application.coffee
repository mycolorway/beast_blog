#= require tao
#= require action_cable
#= require moment
#= require moment/zh-cn
#= require_self
#= require_tree ./channels

class Application extends TaoApplication

  _init: ->
    super
    @cable = ActionCable.createConsumer()
