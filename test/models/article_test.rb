require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "simple validation" do
    assert @article.valid?
  end

  test "required attrs" do
    %w{title body author documentable}.each do |attr|
      article = articles(:article_one)
      article.__send__("#{attr}=", nil)
      assert_equal false, article.valid?
      assert_not article.errors.empty?
      assert article.errors.keys.include? attr.to_sym
    end
  end

  test "title must be unique" do
    new_article = Article.new
    new_article.title = @article.title
    assert_not new_article.valid?
    assert_not new_article.errors.empty?
    assert new_article.errors.keys.include? :title
  end
end
