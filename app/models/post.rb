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
class Post < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true

  has_rich_text :message

  enum :flag, [ :Important, :Urgent, :Critical, :Approved, :Rejected, :Completed, :Paused ]

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :posts, partial: "posts/index", locals: { post: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :posts, target: dom_id(self, :index) }
end
