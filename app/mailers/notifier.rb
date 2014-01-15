# encoding: UTF-8

class Notifier < ActionMailer::Base
  default :from => "Eva Blanes <eva@evablanes.com>", :charset => "utf-8"

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
end
