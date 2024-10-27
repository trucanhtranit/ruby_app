# == Schema Information
#
# Table name: chapters
#
#  id              :integer          not null, primary key
#  attachment_type :string           default("Chapter")
#  content         :text
#  title           :string
#  url             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attachment_id   :integer
#  comic_id        :integer          not null
#
# Indexes
#
#  index_chapters_on_attachment  (attachment_type,attachment_id)
#  index_chapters_on_comic_id    (comic_id)
#
# Foreign Keys
#
#  comic_id  (comic_id => comics.id)
#
class Chapter < ApplicationRecord
  belongs_to :comic
  has_many_attached :images
  has_many :pages, dependent: :destroy
end
