#= require application
#= require_self
#= require desktop/components
#= require_tree .

class DesktopApplication extends Application

window.Beast = {}
Beast.app = window.app = new DesktopApplication()
