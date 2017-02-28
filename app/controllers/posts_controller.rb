class PostsController < ApplicationController
  before_action :author_required, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.any(:html, :js) { @posts = posts.page(params[:page]).per(30) }
      format.atom { @posts = Post.article.published }
    end
  end

  def show
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(30)
  end

  def new
    @post = current_user.posts.create!
    redirect_to edit_post_path(@post)
  end

  def edit
    @turbolinks_no_cache = true
    render layout: 'empty'
  end

  def create
    @post = current_user.posts.create(post_params)
  end

  def update
    @post.update(post_params)
    render('autosave') if params[:autosave].present?
  end

  def destroy
    @post.destroy
  end

  private
    def set_post
      @post = Post.find_by_slug(params[:id]) || Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :slug, :tag_string, :published)
    end

    def posts
      posts = Post.article.order("id DESC")
      posts = posts.tag_with(params[:tag]) if params[:tag].present?
      if current_user&.author?
        posts = posts.published.or(posts.draft.where(author_id: current_user.id))
      else
        posts = posts.published
      end
      posts
    end
end
