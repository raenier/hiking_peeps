class PostsController < ApplicationController
  def index
    @posts = Post.where(user: params[:user] || current_user).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash.now[:notice] = 'Post was successfully created.'
      respond_to(&:turbo_stream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    flash[:notice] = 'Post was successfully deleted.' if Post.find(params[:id]).destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end
end
