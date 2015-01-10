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
		newarticle = params.require(:article).permit(:title, :author, :content)
		article = Article.create(newarticle)
		redirect_to article_path(article.id)
	end

	def show
		@article = Article.find(params[:id])
		render :show
	end

	def edit
		@article = Article.find(params[:id])
		render :edit
	end

	def update
		article = Article.find(params[:id])
		article_params = params.require(:article).permit(:title, :author, :content)
		article.update_attributes(article_params)
		redirect_to article_path(article)
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy
		redirect_to root_path
	end

end
