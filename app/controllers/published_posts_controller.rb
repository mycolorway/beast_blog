class PublishedPostsController < ApplicationController
  before_action :author_required

  def create
    post.publish!
  end

  def destroy
    post.draft!
  end

  private

    def post
      @post ||= Post.find_by_slug(params[:id] || params[:post_id]) ||
        Post.find_by_id(params[:id] || params[:post_id])
    end
end
