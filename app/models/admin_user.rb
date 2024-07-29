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
#  super_admin           :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email  (email)
#
class AdminUser < ApplicationRecord
  has_secure_password :password, validations: true
  validates :email, presence: true, uniqueness: true
end
