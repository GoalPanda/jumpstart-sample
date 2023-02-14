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
class Activity < ApplicationRecord
  belongs_to :component

  has_rich_text :description

  enum :flag, [ :Started, :Ended, :Paused, :Stopped, :Interrumped ]

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :activities, partial: "activities/index", locals: { activity: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :activities, target: dom_id(self, :index) }
end
