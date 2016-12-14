class AlbumsController < ApplicationController
  before_action :author_required, except: [:show, :index]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Post.album.order("id DESC").page(params[:page])
  end

  def new
    @album = Post.new(category: :album)
  end

  def create
    @album = current_user.posts.new(album_params)
    if @album.save
      redirect_to albums_path(@album.slug), notice: "Album was successfully created."
    else
      render :new
    end
  end

  def show
    @photos = @album.photos
  end

  private

    def set_album
      @album = Post.find_by_slug(params[:id]) || Post.find_by_id(params[:id])
    end

    def album_params
      params.require(:post).permit(:title, :slug).merge(category: :album)
    end
end
