class ArticlesController < ApplicationController
  def index
    render json: serializer.new(articles) , status: :ok
  end

  private

  def serializer
    ArticleSerializer
  end

  def articles
    Article.all
  end
end