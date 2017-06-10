#= require application
#= require tao/ui
#= require tao/ui/icons/beast
#= require desktop/components
#= require_self
#= require_tree .

class DesktopApplication extends Application

window.Beast = {}
Beast.app = window.app = new DesktopApplication()
