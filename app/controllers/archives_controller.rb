class ArchivesController < ApplicationController

  def show
    @posts = Post.article.order("id DESC").published.group_by { |post| post.created_at.beginning_of_month }
  end

end
