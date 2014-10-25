if Rails.env.development?
  class MailPreview < MailView
    # Pull data from existing fixtures
    def newsletter
      Notifier.newsletter
    end
  end
end