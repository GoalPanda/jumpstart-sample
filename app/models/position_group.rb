# == Schema Information
#
# Table name: position_groups
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
#  index_position_groups_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class PositionGroup < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
  has_many :employee_positions
  accepts_nested_attributes_for :employee_positions, allow_destroy: true

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :position_groups, partial: "position_groups/index", locals: { position_group: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :position_groups, target: dom_id(self, :index) }
end
