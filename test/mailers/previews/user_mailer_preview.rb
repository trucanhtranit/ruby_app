# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Xem trước email chào mừng
  def welcome_email
    user = User.first
    product = Product.first
    UserMailer.welcome_email(user, product)
  end
end
