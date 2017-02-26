require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:ripley)
    @c1 = circuits(:comp)
    @c2 = circuits(:overdrive)
    @c3 = circuits(:delay)
  end

  test "required attrs" do
    %w{first_name last_name email}.each do |attr|
      user = users(:lambert)
      user.__send__("#{attr}=", nil)
      assert_equal user.valid?, false
    end
  end

  test "can have many favorites" do
    num_favs = @user.favorite_circuits.count
    @user.favorite_circuits << @c1
    assert_equal num_favs + 1, @user.favorite_circuits.count

    @user.favorite_circuits << @c2
    assert_equal num_favs + 2, @user.favorite_circuits.count

    @user.favorite_circuits << @c3
    assert_equal num_favs + 3, @user.favorite_circuits.count
  end
end
