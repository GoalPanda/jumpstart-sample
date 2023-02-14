# == Schema Information
#
# Table name: components
#
#  id          :bigint           not null, primary key
#  budget      :float
#  code        :string
#  color       :integer          default(0)
#  description :text
#  flag        :integer          default("Started")
#  name        :string
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#  project_id  :bigint           not null
#  user_id     :integer
#
# Indexes
#
#  index_components_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class ComponentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
