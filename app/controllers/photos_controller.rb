class PhotosController < ApplicationController
  def index
    @photos = Photo.published.ordered
  end
end