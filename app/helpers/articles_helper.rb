module ArticlesHelper
  def article_author(article)
    user = User.find(article.user_id)
    user.name
  end
end
