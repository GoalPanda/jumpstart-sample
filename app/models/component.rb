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
class Component < ApplicationRecord
  belongs_to :project
  has_many :activities, dependent: :destroy
  accepts_nested_attributes_for :activities, allow_destroy: true

  has_rich_text :description

  enum :flag, [ :Started, :Ended, :Paused, :Stopped, :Interrumped ]

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :components, partial: "components/index", locals: { component: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :components, target: dom_id(self, :index) }
end
