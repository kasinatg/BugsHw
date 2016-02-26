require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(fname: "first", lname: "last", email: "test@kmail.com", thumbnail: "")
  end
  
  test "firstname must be present" do
    assert_not @user.fname == ""
  end

  test "lname must be present" do
    assert_not @user.lname == ""
  end
  
  test "email must be present" do
    assert_not @user.email == ""
  end
  
  test "email must be valid format" do
    assert @user.valid?
  end
  
  test "email must be unquie" do
    User.all do |u|
       begin
         @user.email = u
         assert false, "#{u} should be unquie"
       rescue
        assert true
       end
     end
  end
  
  test "thumbnail must contain either .png, .jpg, or .gif" do
    suffix = ['png','jpg','gif']
    assert @user.thumbnail == "" or suffix.to_s.include? @user.thumbnail.last(3)
  end
end