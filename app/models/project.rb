# == Schema Information
#
# Table name: projects
#
#  id             :bigint           not null, primary key
#  budget         :integer
#  category       :integer          default(0)
#  classification :integer          default(0)
#  code           :string
#  delivery       :integer          default(0)
#  duration       :integer
#  end            :date
#  group          :integer          default(0)
#  identificator  :integer
#  manager        :integer
#  name           :string
#  number         :integer
#  percentage     :integer
#  routine        :integer          default(0)
#  scale          :integer          default(0)
#  sorting        :integer          default(0)
#  start          :date
#  status         :integer
#  supervisor     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint           not null
#  project_id     :integer
#
# Indexes
#
#  index_projects_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Project < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
  has_many :components, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :components, allow_destroy: true
  accepts_nested_attributes_for :posts, allow_destroy: true
  
  has_rich_text :description

  validates :name, presence: true
  validates :code, uniqueness: true

  scope :sorted, -> { order(projects: :desc, name: :desc) }

  enum :status, [ :Default, :Active, :Inactive, :Paused, :Stopped ]
  enum :identificator, [ :Conception, :Bidding, :Awarded, :Cancelled ]

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :projects, partial: "projects/index", locals: { project: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :projects, target: dom_id(self, :index) }
end
