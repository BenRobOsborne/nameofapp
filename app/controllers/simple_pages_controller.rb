class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @products = Product.limit(4)
  end

  def thank_you
#byebug
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
    ActionMailer::Base.mail(from: @email, to: 'benosborne605@gmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end

end
