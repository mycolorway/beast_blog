#= require application
#= require_self
#= require mobile/components
#= require_tree .

class MobileApplication extends Application

window.Beast = {}
Beast.app = window.app = new MobileApplication()
