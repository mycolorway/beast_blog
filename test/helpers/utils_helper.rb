module UtilsHelper
  def sign_in_as user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end


  def random_string length: 15
    (0...length).map { ('a'..'z').to_a[rand(26)] }.join
  end

end

class ActionDispatch::IntegrationTest
  include UtilsHelper
end
