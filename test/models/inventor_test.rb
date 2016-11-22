# == Schema Information
#
# Table name: inventors
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  hire_date  :date
#  speciality :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InventorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
