require 'test_helper'

class CircuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circuit = @squeezie
    @new_circuit = {
      name: "Krispy Drive",
      description: "Deep fried Klon clone",
      difficulty: 1,
      submitter_id: @ripley.id,
      effect_type_ids: @overdrive.id
    }
  end

  test "should get index" do
    get circuits_url
    assert_response :success
  end

  test "should get new" do
    get new_circuit_url
    assert_response :success
  end

  test "should create circuit" do
    assert_difference('Circuit.count') do
      post circuits_url, params: { circuit: @new_circuit }
    end

    assert_redirected_to circuit_url(Circuit.last)
  end

  test "should show circuit" do
    get circuit_url(@circuit)
    assert_response :success
  end

  test "should get edit" do
    get edit_circuit_url(@circuit)
    assert_response :success
  end

  test "should update circuit" do
    patch circuit_url(@circuit), params: { circuit: { description: @circuit.description, difficulty: @circuit.difficulty, name: @circuit.name } }
    assert_redirected_to circuit_url(@circuit)
  end

  test "should update effect_types" do
    new_ids_string = @circuit.effect_type_ids_string + ",#{@fuzz.id}"
    num = @circuit.effect_types.length
    patch circuit_url(@circuit), params: {
      circuit: {
        effect_type_ids: new_ids_string
      }
    }

    @circuit.reload
    assert_equal num + 1, @circuit.effect_types.length
    assert_redirected_to circuit_url(@circuit)
  end

  test "should update submitter" do
    orig_submitter = @circuit.submitter
    patch circuit_url(@circuit), params: {
      circuit: {
        submitter_id: @ash.id
      }
    }

    assert_redirected_to circuit_url(@circuit)
    @circuit.reload
    assert_not_equal orig_submitter, @circuit.submitter
  end

  test "should destroy circuit" do
    assert_difference('Circuit.count', -1) do
      delete circuit_url(@circuit)
    end

    assert_redirected_to circuits_url
  end
end
