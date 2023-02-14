# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  flag       :integer          default("Important")
#  message    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  project_id :bigint           not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
