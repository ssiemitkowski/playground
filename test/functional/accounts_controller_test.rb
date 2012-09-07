require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  test "should get title:string" do
    get :title:string
    assert_response :success
  end

end
