class BeastApplication extends TaoApplication
  _init: ->
    super

beast = {}

beast.App = BeastApplication
beast.app = new BeastApplication()
