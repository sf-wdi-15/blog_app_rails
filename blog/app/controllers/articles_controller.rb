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
            new_article = params.require(:article).permit(:title, :content)
            article = Article.create(new_article)
            redirect_to "/articles/#{article.id}"
        end

	def show
            id = params[:id]
            @article = Article.find(id)
            render :show
    end

    def edit
            id = params[:id]
            @article = Article.find(id)
            render :edit
    end

    def update
        article = Article.find(params[:id])
        article_params = params.require(:article).permit(:title, :content)
        article.update(article_params)
        redirect_to article_path(article)
    end

     def destroy
        id = params[:id]
        article = Article.find(id)
        article.destroy
        redirect_to "/articles"
    end
end
