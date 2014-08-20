# encoding: UTF-8

class Notifier < ActionMailer::Base
  include Roadie::Rails::Automatic

  layout 'newsletter', only: 'newsletter'

  default :from => "Eva Blanes <eva@evablanes.com>", :charset => "utf-8", :css => 'notifier/email'

  def reset_password_email(user)
    @user = user

    mail(to: user.email, subject: t('subject', :scope => 'notifier.reset_password_email'))
  end

  def contact_proposal(name, company, email, phone, message)
    @name = name
    @company = company
    @email = email
    @phone = phone
    @message = message

    mail(to: 'eva@evablanes.com', subject: 'WEB EVA BLANES: Nova sol·licitud de contacte')
  end

  def newsletter
    mail(to: 'victormier@gmail.com', subject: 'Newsletter')
  end
end
