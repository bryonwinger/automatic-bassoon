require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "required attrs" do
    %w{first_name last_name email}.each do |attr|
      user = users(:lambert)
      user.__send__("#{attr}=", nil)
      assert_equal user.valid?, false
    end
  end

  test "email must be unique" do
    new_user = User.new
    new_user.email = @ripley.email
    assert_not new_user.valid?
    assert_not new_user.errors.empty?
    assert new_user.errors.keys.include? :email
  end

  test "can have many favorites" do
    num = @ripley.favorite_circuits.count
    @ripley.favorite_circuits << @squeezie
    assert_equal num + 1, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @greenbox
    assert_equal num + 2, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @digipeat
    assert_equal num + 3, @ripley.favorite_circuits.count
  end

  test "favorites are distinct" do
    @ripley.favorite_circuits << @squeezie
    num = @ripley.favorite_circuits.count

    # Try adding the same one again
    @ripley.favorite_circuits << @squeezie
    assert_equal num, @ripley.favorite_circuits.count
  end
end
