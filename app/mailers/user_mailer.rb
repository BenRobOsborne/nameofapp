class UserMailer < ApplicationMailer
  default from: "benosborne605@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
         :to => 'benosborne605@gmail.com',
         :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Pushys Chain Reaction"
    mail(:to => user.email, :subject=> "Welcome to #{@appname}!")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(:to => user.email, :subject=> "Thankyou for your purchase!")
  end

end
