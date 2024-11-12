class UserMailer < ApplicationMailer
  def welcome_email(user, product)
    @user = user
    @product = product
    mail(to: 'trucanh@itviec.com', subject: "Welcome to Our App!")
  end
end
