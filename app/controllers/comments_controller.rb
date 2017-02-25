class CommentsController < ApplicationController
  before_action :login_required, only: [:create]
  # before_action :author_required, only: [:destroy]
  before_action :set_post, only: [:create, :index]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @post.comments.sort.page(params[:page]).per(30)
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
  end

  def destroy
    @comment.destroy
  end

  private

    def set_comment
      @comment = Comment.find_by_id params[:id]
    end

    def set_post
      @post = Post.find_by_slug(params[:post_id]) || Post.find_by_id(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
