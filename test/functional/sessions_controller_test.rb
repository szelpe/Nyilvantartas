require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @request.env["HTTP_REFERER"] = '/project/new'
    @user = users(:userTHree)
  end
  
  test "login" do
    get :create, :username => @user.username, :password => "pass"
    assert_response :redirect
    assert_equal session[:user], @user.id
  end
  
  test "logout" do
    get :destroy, nil, {:user => @user.id}
    assert_response :redirect
    assert_nil session[:user]
  end
end
