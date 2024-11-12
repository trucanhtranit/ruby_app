# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  price       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Product < ApplicationRecord
end
