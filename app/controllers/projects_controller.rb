class ProjectsController < ApplicationController
  def index
    @projects = Project.published.ordered
  end

  def show
    @project = Project.find_for_show(params[:id])
  end
end