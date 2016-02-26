require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(fname: "first", lname: "last", email: "test@kmail.com", thumbnail: "")
    @bug = Bug.create(title: "a title", user_id: @user.id, description: "This is the actual test of bug. It can be rather long.", issuetype: 0, priority: 1, status: 0)
   end
  
  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end
  
  
  test "issue type must be valid" do
    invalid_types = [-10, -1, 2, 10]
    invalid_types.each do |is|
      begin
          @bug.issuetype = is
          assert false, "#{is} should be invalid"
      rescue
         assert true
      end
    end
  end
  
  test "priority must be valid" do
    invalid_priorities = [-9, -11, 3, 10]
    invalid_priorities.each do |is1|
      begin
        @bug.priority = is1
        assert false, "#{is1} should be invalid"
      rescue
        assert true
      end
    end
  end
 
   test "status must be valid" do
     invalid_statuses = [-10, -1, 2, 10]
     invalid_statuses.each do |is2|
       begin
         @bug.status = is2
         assert false, "#{is2} should be invalid"
       rescue
        assert true
       end
     end
   end
   
  test "status should be open" do
    assert_not @bug.status == :open?
  end
  
 test "priority should be medium" do
    assert_not @bug.priority == :medium?
  end
  
 test "issuetype should be feature" do
    assert_not @bug.issuetype == :feature?
  end
end



