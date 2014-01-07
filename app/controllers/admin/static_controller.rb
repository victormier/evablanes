# encoding: utf-8

class Admin::StaticController < Admin::ApplicationController
  def about
    @about_me = KeyValue.find_by_key('about_me')
    @about_awards = KeyValue.find_by_key('about_awards')
  end

  def home
    @home_about_me = KeyValue.find_by_key('home_about_me')
    @home_publications = KeyValue.find_by_key('home_publications')
  end
end