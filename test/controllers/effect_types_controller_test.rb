require 'test_helper'

class EffectTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @effect = @overdrive
    @new_effect = {
      name: "new-fx"
    }
  end

  test "should get index" do
    get effect_types_url
    assert_response :success
  end

  test "should get new" do
    get new_effect_type_url
    assert_response :success
  end

  test "should create effect_type" do
    assert_difference('EffectType.count') do
      post effect_types_url, params: { effect_type: @new_effect }
    end

    assert_redirected_to effect_type_url(EffectType.last)
  end

  test "should show effect_type" do
    get effect_type_url(@effect)
    assert_response :success
  end

  test "should get edit" do
    get edit_effect_type_url(@effect)
    assert_response :success
  end

  test "should update effect_type" do
    before = @effect.name
    new_val = "new-value"
    new_params = {effect_type: {name: new_val}}

    patch effect_type_url(@effect), params: new_params

    @effect.reload
    assert_not_equal @effect, before
    assert_equal @effect.name, new_val
    assert_redirected_to effect_type_url(@effect)
  end

  test "should destroy effect_type" do
    assert_difference('EffectType.count', -1) do
      delete effect_type_url(@effect)
    end

    assert_redirected_to effect_types_url
  end
end
