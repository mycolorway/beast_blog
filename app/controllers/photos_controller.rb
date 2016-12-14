class PhotosController < ApplicationController

  def create
    @album = Post.album.find_by_slug(params[:album_id]) ||Post.album.find_by_id(params[:album_id])
    @album.photos.new(photo: params[:photo])
    @album.save
    redirect_to album_path(@album.slug)
  end

end
