#= require application
#= require tao/ui/mobile
#= require tao/ui/icons/beast
#= require mobile/components
#= require_self
#= require_tree .

class MobileApplication extends Application

window.Beast = {}
Beast.app = window.app = new MobileApplication()
