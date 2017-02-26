require 'test_helper'

class CircuitTest < ActiveSupport::TestCase
  setup do
    @circuit = circuits(:overdrive)
    @fx1 = effect_types(:overdrive)
    @fx2 = effect_types(:compression)
    @fx3 = effect_types(:delay)
  end

  test "simple validation" do
    assert @circuit.valid?
  end

  test "required attrs" do
    %w{name difficulty submitter}.each do |attr|
      circuit = circuits(:fuzz)
      circuit.__send__("#{attr}=", nil)
      assert_equal false, circuit.valid?
    end
  end

  test "must have at least one effect type" do
    @circuit.effect_types.clear
    assert_equal false, @circuit.valid?
  end

  test "can have multiple effect types" do
    @circuit.effect_types << @fx1
    assert @circuit.valid?
    @circuit.effect_types << @fx2
    assert @circuit.valid?
    @circuit.effect_types << @fx3
    assert @circuit.valid?
  end
end
