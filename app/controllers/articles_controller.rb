class ArticlesController < ApplicationController
  before_action :logged_in_user,  only: [:new, :create]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = cookies.signed[:user_id]
    if @article.save 
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def logged_in_user
      redirect_to root_url unless logged_in?
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
