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
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
