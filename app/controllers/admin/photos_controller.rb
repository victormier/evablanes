# encoding: utf-8

class Admin::PhotosController < Admin::ApplicationController
  before_filter :find_photo, only: [:destroy, :sort, :toggle_published]

  def index
    @photos = Photo.ordered
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      flash[:notice] = "Imatge pujada correctament"
      redirect_to admin_photos_path
    else
      flash[:alert] = "Corregeix els errors del formulari"
      render :action => :new
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Imatge eliminada correctament"
    redirect_to :back
  end

  def sort
    @photo.update_attribute :sort_order_position, params[:sort_order_position]

    if params[:redirect]
      redirect_to :back
    else
      render nothing: true
    end
  end

  def toggle_published
    @photo.toggle!(:published)

    redirect_to :back
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
