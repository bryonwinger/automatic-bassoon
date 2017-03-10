module ArticlesHelper
  def article_summary(article)
    max_length = 80
    body_summary = if article.body.length > max_length
      "#{article.body[0..max_length]}..."
    else
      article.body
    end

    "<strong>#{article.title}:</strong> <em>#{body_summary}</em>".html_safe
  end
end
