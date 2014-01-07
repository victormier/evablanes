class StaticController < ApplicationController
  def index
    @slider_projects = Project.published.in_slider.slider_ordered
    @featured_projects = Project.published.featured.featured_ordered.limit(3)
    @some_projects = Project.published.ordered.limit(8)
    @home_about_me = KeyValue.find_by_key('home_about_me')
    @home_publications = KeyValue.find_by_key('home_publications')
  end

  def about
    @about_me = KeyValue.find_by_key('about_me')
    @about_awards = KeyValue.find_by_key('about_awards')
  end

  def contact
  end

  def send_contact_request
  end
end