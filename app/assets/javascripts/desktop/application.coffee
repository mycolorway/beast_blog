#= require application
#= require_self
#= require_tree .
#= require desktop/components/components

class DesktopApplication extends TaoApplication

window.Beast = {}
Beast.app = window.app = new DesktopApplication()
