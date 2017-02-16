#= require application
#= require_self
#= require_tree .
#= require mobile/components/components

class MobileApplication extends TaoApplication

window.app = new MobileApplication()
window.Beast = {}
Beast.app = window.app
