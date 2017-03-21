class PhotosController < ApplicationController

  def new
    @photo = Photo.new(params[:user_id])
  end

  def create
    @photo = current_user.photos.new(photo_params)
    current_gallery = Gallery.find(params[:id])
    if current_gallery.user == current_user
      current_gallery.photos << @photo
      current_gallery.save
      redirect_to current_gallery
    else
      render :new
    end
  end

  def index
    @photos = Photo.all
  end

  def show
    @photos = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :id, :image)
  end
end
