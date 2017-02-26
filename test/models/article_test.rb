require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "simple validation" do
    assert @article_one.valid?
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
    new_article.title = @article_one.title
    assert_not new_article.valid?
    assert_not new_article.errors.empty?
    assert new_article.errors.keys.include? :title
  end

  test "create new artice" do
    new_article = {
      title: "A New Article",
      body: "A New Body",
      author: @ash,
      documentable: @article_one.documentable
    }
    assert_difference('Article.count', 1) do
      Article.create(new_article)
    end

    last_article = Article.last
    assert_equal @ash, last_article.author
    assert_equal @article_one.documentable, last_article.documentable
  end
end
