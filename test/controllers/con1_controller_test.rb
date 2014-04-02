require 'test_helper'

class Con1ControllerTest < ActionController::TestCase
  test "should get error" do
    get :error
    assert_response :missing
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
