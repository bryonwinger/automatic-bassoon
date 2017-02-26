require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "required attrs" do
    %w{first_name last_name email}.each do |attr|
      user = users(:lambert)
      user.__send__("#{attr}=", nil)
      assert_equal user.valid?, false
    end
  end

  test "can have many favorites" do
    num_favs = @ripley.favorite_circuits.count
    @ripley.favorite_circuits << @squeezie
    assert_equal num_favs + 1, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @greenbox
    assert_equal num_favs + 2, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @digipeat
    assert_equal num_favs + 3, @ripley.favorite_circuits.count
  end

  test "favorites are unique" do
    num_favs = @ripley.favorite_circuits.count
    @ripley.favorite_circuits << @squeezie
    assert_equal num_favs + 1, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @squeezie
    assert_equal num_favs + 2, @ripley.favorite_circuits.count

    @ripley.favorite_circuits << @digipeat
    assert_equal num_favs + 3, @ripley.favorite_circuits.count
  end
end
