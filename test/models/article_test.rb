require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
    @article.author = users(:one)
  end

  test "simple validation" do
    assert @article.valid?
  end

  test "required attrs" do
    %w{title body author}.each do |attr|
      article = articles(:one)
      article.__send__("#{attr}=", nil)
      assert_equal false, article.valid?
    end
  end
end
