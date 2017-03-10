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

  test "name must be unique" do
    new_circuit = Circuit.new
    new_circuit.name = @orangebox.name
    assert_not new_circuit.valid?
    assert_not new_circuit.errors.empty?
    assert new_circuit.errors.keys.include? :name
  end

  test "must have at least one effect type" do
    @orangebox.effect_types.clear
    assert_equal false, @orangebox.valid?
  end

  test "can add multiple effect types" do
    @orangebox.effect_types << @overdrive
    assert @orangebox.valid?
    assert @orangebox.effect_types.include?(@overdrive)
    @orangebox.effect_types << @compression
    assert @orangebox.valid?
    assert @orangebox.effect_types.include?(@compression)
    @orangebox.effect_types << @delay
    assert @orangebox.valid?
    assert @orangebox.effect_types.include?(@delay)
  end

  test "effect types are distinct" do
    @orangebox.effect_types << @fuzz
    num = @orangebox.effect_types.count
    @orangebox.effect_types << @fuzz
    assert_equal num, @orangebox.effect_types.count
  end

  test "can remove article" do
    @vermin.article = nil
    assert_nil @vermin.article
    assert @vermin.valid?
  end

  test "can add article" do
    circuit = Circuit.new(@new_circuit_params)
    circuit.article = @article_one
    assert circuit.article = @article_one
  end

  # test "articles are distinct" do
    # @vermin.articles << @article_one
    # num = @vermin.articles.count
    # @vermin.articles << @article_one
    # assert_equal num, @vermin.articles.count
  # end
end
