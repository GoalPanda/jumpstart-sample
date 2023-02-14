# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  budget       :float
#  code         :string
#  color        :integer          default(0)
#  description  :text
#  flag         :integer          default("Started")
#  name         :string
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  component_id :bigint           not null
#  parent_id    :integer
#  user_id      :integer
#
# Indexes
#
#  index_activities_on_component_id  (component_id)
#
# Foreign Keys
#
#  fk_rails_...  (component_id => components.id)
#
require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
