require 'test_helper'

class NewMemberTest < ActionDispatch::IntegrationTest
  fixtures :all
  test "new member" do
     get url_for(:controller => :members, :action => :new)
     assert_response :success
     
     post_via_redirect "/sessions/create", {:username=>users(:userOne).username,
      :password=>'pass'}, { "HTTP_REFERER"=>'/members/new' }
     assert_response :success
     assert_equal session[:user], users(:userOne).id
     s = Member.all.size
     post_via_redirect "/members",
      { :members => { :name => "Zsolt", :nick => "zsoca", :positions => "A legjobb", :is_senior => true, :email => "zsoca@cime.hu" , :introduction => "Ez egy teszt leiras", :image_link => "nincs" } }
     assert_equal s+1, Member.all.size
  end
end
