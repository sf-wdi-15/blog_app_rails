class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render :index
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    new_article = params.require(:article).permit(:title, :author, :content)
    article = Article.create(new_article)
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    keywords = @article.make_request
    render :show
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    article_id = params[:id]
    article = Article.find(article_id)
    updated_attributes = params.require(:article).permit(:title, :author, :content)
    article.update_attributes(updated_attributes)
    redirect_to article_path(article_id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

end
