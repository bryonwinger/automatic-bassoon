require 'test_helper'

class EffectTypeTest < ActiveSupport::TestCase
  test "simple validation" do
    assert @overdrive.valid?
  end

  test "required attrs" do
    @overdrive.name = nil
    assert_not @overdrive.valid?
  end

  test "name must be unique" do
    new_type = EffectType.new
    new_type.name = @overdrive.name
    assert_not new_type.valid?
    assert_not new_type.errors.empty?
    assert new_type.errors.keys.include? :name
  end
end
