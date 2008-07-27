class <%= class_name %>Mailer < ActionMailer::Base
  
  def forgot_password(password)
    setup_email(password.<%= controller_singular_name %>)
    @subject    += 'You have requested to change your password'
    @body[:url]  = "http://YOURSITE/change_password/#{password.reset_code}"
  end

  def reset_password(<%= controller_singular_name %>)
    setup_email(<%= controller_singular_name %>)
    @subject    += 'Your password has been reset.'
  end

  protected
    def setup_email(<%= controller_singular_name %>)
      @recipients  = "#{<%= controller_singular_name %>.email}"
      @from        = "ADMINEMAIL"
      @subject     = "[YOURSITE] "
      @sent_on     = Time.now
      @body[:<%= controller_singular_name %>] = <%= controller_singular_name %>
    end
end