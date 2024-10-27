# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  content    :text
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer          not null
#
# Indexes
#
#  index_pages_on_chapter_id  (chapter_id)
#
# Foreign Keys
#
#  chapter_id  (chapter_id => chapters.id)
#
require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
