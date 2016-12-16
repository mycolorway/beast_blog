class CommentsController < ApplicationController
  before_action :login_required, only: [:create]
  before_action :set_post, only: [:create, :index]

  def index
    @comments = @post.comments.page(params[:page]).per(30)
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
  end

  private

    def set_post
      @post = Post.find_by_slug(params[:post_id]) || Post.find_by_id(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
