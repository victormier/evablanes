require 'mailchimp'

class NewsletterController < ApplicationController
  before_filter :setup_mailchimp_api, only: [:subscribe]

  def subscribe
    email = params[:email]

    begin
      @mail_chimp.lists.subscribe(ENV['MAILCHIMP_LIST_ID'], {'email' => email})
      @message = "#{email} subscribed successfully. Thanks!"
    rescue Mailchimp::ListAlreadySubscribedError
      @message = "#{email} is already subscribed to the list"
    rescue Mailchimp::ListDoesNotExistError
      @message = "There has been a problem"
      return
    rescue Mailchimp::Error => ex
      if ex.message
        @message = ex.message
      else
        @message = "An unknown error occurred"
      end
    end
  end

  private

  def setup_mailchimp_api
    @mail_chimp = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
  end
end