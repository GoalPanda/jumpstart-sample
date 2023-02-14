# == Schema Information
#
# Table name: employee_positions
#
#  id                          :bigint           not null, primary key
#  cost                        :integer
#  cost_auto                   :float
#  cost_fixed                  :float
#  description_auto            :integer
#  description_definer         :boolean
#  description_fixed           :integer
#  identificator               :bigint
#  item                        :string
#  position_cos_definer        :boolean
#  type                        :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  account_id                  :bigint           not null
#  position_categories_id      :bigint           not null
#  position_classifications_id :bigint           not null
#  position_groups_id          :bigint           not null
#  position_types_id           :bigint           not null
#
# Indexes
#
#  index_employee_positions_on_account_id                   (account_id)
#  index_employee_positions_on_position_categories_id       (position_categories_id)
#  index_employee_positions_on_position_classifications_id  (position_classifications_id)
#  index_employee_positions_on_position_groups_id           (position_groups_id)
#  index_employee_positions_on_position_types_id            (position_types_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (position_categories_id => position_categories.id)
#  fk_rails_...  (position_classifications_id => position_classifications.id)
#  fk_rails_...  (position_groups_id => position_groups.id)
#  fk_rails_...  (position_types_id => position_types.id)
#
require "test_helper"

class EmployeePositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
