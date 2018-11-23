require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "full_name returns the capitalized first name and last name" do
    user = User.new(first_name: "john", last_name: "lennon")
    assert_equal "John Lennon", user.full_name
    user = User.new(first_name: "ringo", last_name: "starr")
    assert_equal "Ringo Starr", user.full_name
  end
end
