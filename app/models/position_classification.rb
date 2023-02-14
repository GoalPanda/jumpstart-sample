# == Schema Information
#
# Table name: position_classifications
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
#  index_position_classifications_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class PositionClassification < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
  has_many :employee_positions

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :position_classifications, partial: "position_classifications/index", locals: { position_classification: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :position_classifications, target: dom_id(self, :index) }
end
