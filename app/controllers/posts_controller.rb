class PostsController < ApplicationController
  before_action :author_required, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    load_posts
    respond_to do |format|
      format.html { @posts = @posts.page(params[:page]).per(30) }
      format.atom
    end
  end

  def show
    @comments = @post.comments.page(params[:page]).per(30)
  end

  def new
    @post = Post.new
    render layout: 'fullscreen'
  end

  def edit
  end

  def create
    @post = current_user.posts.create(post_params)
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
      params.require(:post).permit(:title, :content, :slug, :tag_string)
    end

    def load_posts
      @posts = Post.article.order("id DESC")
      if params[:tag].present?
        @posts = @posts.tag_with(params[:tag])
      end
    end
end
