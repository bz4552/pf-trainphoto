class PostsController < ApplicationController
 before_action :authenticate_user! ,except: [:top, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.company = params[:post][:company]
    @post.line = params[:post][:line]
    @post.series = params[:post][:series]
    @post.car = params[:post][:car]
    @post.title = params[:post][:title]
    @post.date = params[:post][:date]
    if @post.save
      redirect_to posts_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:company, :line, :series, :car, :place, :title, :date, :body, images_images: [])
  end

end
