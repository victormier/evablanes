class StaticController < ApplicationController
  def index
    @slider_projects = Project.published.in_slider.slider_ordered
    @featured_projects = Project.published.featured.featured_ordered.limit(3)
    @some_projects = Project.published.ordered.limit(8)
  end

  def about
  end

  def contact
  end

  def send_contact_request
  end
end