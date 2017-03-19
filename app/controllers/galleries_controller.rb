class GalleriesController < ApplicationController

  def index
  end

  def show
    @gallery = gallery.fin(params[:id])
    @recent_galleries = Gallery.order(created_at: :desc).offset(1).limit(4)
  end

  def create
    @gallery = Gallery.new
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end

end
