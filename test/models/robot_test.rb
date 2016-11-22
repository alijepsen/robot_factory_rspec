# == Schema Information
#
# Table name: robots
#
#  id            :integer          not null, primary key
#  name          :string
#  serial_number :string
#  evil          :boolean
#  color         :string
#  industry      :string
#  inventor_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RobotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
