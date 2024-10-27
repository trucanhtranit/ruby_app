# == Schema Information
#
# Table name: admin_users
#
#  id                    :integer          not null, primary key
#  email                 :string
#  first_name            :string
#  last_name             :string
#  password_confirmation :string
#  password_digest       :string
#  provider              :string
#  super_admin           :boolean
#  uid                   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email  (email)
#
class AdminUser < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_secure_password :password, validations: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = AdminUser.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = AdminUser.create(first_name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20],
           provider: access_token.provider,
           uid: access_token.uid
        )
    end
    user
end
end
