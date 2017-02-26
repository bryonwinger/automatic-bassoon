require 'test_helper'

class CircuitTest < ActiveSupport::TestCase
  test "simple validation" do
    assert @orangebox.valid?
  end

  test "required attrs" do
    %w{name difficulty submitter}.each do |attr|
      circuit = circuits(:vermin)
      circuit.__send__("#{attr}=", nil)
      assert_equal false, circuit.valid?
    end
  end

  test "must have at least one effect type" do
    @orangebox.effect_types.clear
    assert_equal false, @orangebox.valid?
  end

  test "can have multiple effect types" do
    @orangebox.effect_types << @overdrive
    assert @orangebox.valid?
    @orangebox.effect_types << @compression
    assert @orangebox.valid?
    @orangebox.effect_types << @delay
    assert @orangebox.valid?
  end
end
