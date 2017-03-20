class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new(params[:user_id])
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end

end
