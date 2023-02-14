# == Schema Information
#
# Table name: position_categories
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
#  index_position_categories_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class PositionCategory < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :position_categories, partial: "position_categories/index", locals: { position_category: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :position_categories, target: dom_id(self, :index) }
end
