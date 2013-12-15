# encoding: utf-8

class Admin::ProjectPicturesController < Admin::ApplicationController
  before_filter :find_project_picture, only: [:destroy, :sort]
  before_filter :load_project, :only => [ :index, :new, :create ]

  def index
    @project_pictures = @project.project_pictures.ordered
  end

  def new
    @project_picture = ProjectPicture.new
  end

  def create
    @project_picture = ProjectPicture.new(params[:project_picture])
    @project_picture.project = @project
    # @project_picture = @project.project_pictures.new(params[:project_picture])

    if @project_picture.save
      flash[:notice] = "Imatge pujada correctament"
      redirect_to admin_project_project_pictures_url(@project.id)
    else
      flash[:alert] = "Corregeix els errors del formulari"
      render :action => :new
    end
  end

  def destroy
    @project_picture.destroy
    flash[:notice] = "Imatge eliminada correctament"
    redirect_to :back
  end

  def sort
    @project_picture.update_attribute :sort_order_position, params[:sort_order_position]

    render nothing: true
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def find_project_picture
    @project_picture = ProjectPicture.find(params[:id])
  end
end