class ArticlesController < ApplicationController

  def index
    articles = Article.where(is_member_only: false).includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

end
