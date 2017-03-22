#= require application
#= require_self
#= require desktop/components
#= require_tree .

class DesktopApplication extends TaoApplication

window.Beast = {}
Beast.app = window.app = new DesktopApplication()
