# == Schema Information
#
# Table name: position_types
#
#  id            :bigint           not null, primary key
#  description   :text
#  identificator :integer
#  name          :string
#  value         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_position_types_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class PositionTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
