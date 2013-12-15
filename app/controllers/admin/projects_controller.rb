# encoding: utf-8

class Admin::ProjectsController < Admin::ApplicationController
  before_filter :find_project, only: [:edit, :update, :destroy, :toggle_published, :sort, :toggle_in_slider, :toggle_featured]

  def index
    @projects = Project.ordered
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = "Projecte creat correctament"
      redirect_to admin_projects_path(@section)
    else
      flash[:alert] = "Corregeix els errors"
      render :action => :new
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Projecte actualitzat correctament"
      redirect_to admin_projects_path(@section)
    else
      flash[:alert] = "Corregeix els errors"
      render :action => :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Projecte eliminat correctament"
    redirect_to :back
  end

  def toggle_published
    @project.toggle!(:published)

    redirect_to :back
  end

  def toggle_in_slider
    @project.toggle!(:in_slider)

    redirect_to :back
  end

  def toggle_featured
    @project.toggle!(:featured)

    redirect_to :back
  end

  def sort
    @project.update_attribute :sort_order_position, params[:sort_order_position]

    render nothing: true
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end
end