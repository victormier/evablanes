class StaticController < ApplicationController
  def index
    @slider_projects = Project.published.in_slider.ordered
    @featured_projects = Project.published.featured.ordered.limit(3)
  end
end