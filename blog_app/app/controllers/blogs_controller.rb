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
    newBlog = params.require(:blog).permit(:title, :author, :content)
    blog = Blog.create(newBlog)
    redirect_to blog_path(blog.id)
  end

  def show
    @blog = Blog.find(params[:id])
    render :show
  end

  def edit 
    @blog = Blog.find(params[:id])
    render :edit
  end


  def update
    blog = Blog.find(params[:id])
    blog_params = params.require(:blog).permit(:title, :author, :content)
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end


  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end


end