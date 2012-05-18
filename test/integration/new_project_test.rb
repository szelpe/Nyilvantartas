require 'test_helper'

class NewProjectTest < ActionDispatch::IntegrationTest
  fixtures :all
  test "new project" do
     get url_for(:controller => :projects, :action => :new)
     assert_response :success
     
     post_via_redirect "/sessions/create", {:username=>users(:userOne).username,
      :password=>'pass'}, { "HTTP_REFERER"=>'/projects/new' }
     assert_response :success
     assert_equal session[:user], users(:userOne).id
     s = Project.all.size
     post_via_redirect "/projects",
      { :projects => { :name => "Test project", :description => "Ez egy tesz leiras" } }
     assert_equal s+1, Project.all.size
  end
end
