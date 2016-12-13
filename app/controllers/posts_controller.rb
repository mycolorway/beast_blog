class PostsController < ApplicationController
  before_action :author_required, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post.slug), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.slug), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find_by_slug(params[:id]) || Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end
end
