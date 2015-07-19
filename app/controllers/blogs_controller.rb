class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    render :index
  end

  def new
    @blog = Blog.new
    render :new
  end

  def create
    new_blog = params.require(:blog).permit(:title, :date, :content)
    blog = Blog.create(new_blog)
    redirect_to blog_path(blog.id)
  end

  def show
    id = params[:id]
    @blog = Blog.find(id)
    render :show
  end

  def edit
    if current_user 
      id = params[:id]
      @blog = Blog.find(id)
      render :edit
    else
      redirect_to login_path
    end
  end

  def update
        
    blog = Blog.find(params[:id])

    # get updated data
    blog_params = params.require(:blog).permit(:title, :date, :content)
    # update the blog
    blog.update(blog_params)

    redirect_to blog_path(blog)
  end 

  def destroy
    if current_user
    id = params[:id]
    blog = Blog.find(id)
    blog.destroy
    redirect_to "/blogs"
  end
end


end
