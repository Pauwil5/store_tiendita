class UserMailer < ApplicationMailer
	default from: 'paulandrea5@gmail.com'

	  def welcome_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Bienvenido SmartFan')
	  end

end
