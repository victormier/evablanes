class ContactController < ApplicationController
  def index
    @publication = Publication.find(params[:publication]) if params[:publication]
  end

  def create
    Notifier.contact_proposal(params[:name], params[:company], params[:email], params[:phone], params[:message]).deliver
  end
end