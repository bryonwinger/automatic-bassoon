require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @circuit = circuits(:one)
    @circuit.submitter = users(:one)
    @circuit.effect_types << effect_types(:overdrive)
  end

  test "required attrs" do
    %w{first_name last_name email}.each do |attr|
      user = users(:one)
      user.__send__("#{attr}=", nil)
      assert_equal user.valid?, false
    end
  end

  test "can have many favorites" do
    num_favs = @user.favorite_circuits.count
    @user.favorite_circuits << @circuit
    assert_equal num_favs + 1, @user.favorite_circuits.count

    @user.favorite_circuits << @circuit
    assert_equal num_favs + 2, @user.favorite_circuits.count

    @user.favorite_circuits << @circuit
    assert_equal num_favs + 3, @user.favorite_circuits.count
  end
end
