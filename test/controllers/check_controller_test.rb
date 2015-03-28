require 'test_helper'

class CheckControllerTest < ActionController::TestCase
  test "should get action" do
    get :action
    assert_response :success
  end

end
