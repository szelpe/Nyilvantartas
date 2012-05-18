require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must have username" do
    u = User.new
    assert !u.save, "Error" 
  end
  
  test "user must have unique username" do
    u = User.new
    u.username = users(:userOne).username
    u.password = 'pass'
    u.password_confirmation = 'pass'
      
    assert !u.save, "Error" 
  end
  
  test "username must be longer then 3" do
    u = User.new
    u.username = "asd"
    u.password = 'pass'
    u.password_confirmation = 'pass'
      
    assert !u.save, "Error" 
  end
  
  test "username must be shorter then 21" do
    u = User.new
    u.username = "asdasasdasasdasasdasa"
    u.password = 'pass'
    u.password_confirmation = 'pass'
      
    assert !u.save, "Error" 
  end
  
  test "user must confirm password" do
    u = User.new
    u.username = "asdasas"
    u.password = 'pass'
    u.password_confirmation = 'passnot'
      
    assert !u.save, "Error" 
  end
end
