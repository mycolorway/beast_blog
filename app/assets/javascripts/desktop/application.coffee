#= require application
#= require_self
#= require_tree .
#= require desktop/components/components

class DesktopApplication extends TaoApplication

window.app = new DesktopApplication()
window.Beast = {}
Beast.app = window.app
