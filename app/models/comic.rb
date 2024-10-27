# == Schema Information
#
# Table name: comics
#
#  id          :integer          not null, primary key
#  author      :string
#  available   :boolean
#  description :text
#  image_url   :string
#  status      :string
#  title       :string
#  url         :string
#  views_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_comics_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Comic < ApplicationRecord
  validates :title, presence: true
  belongs_to :category
  has_many :chapters, dependent: :destroy
end
