# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  name       :string
#  number     :integer
#  robot_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Part < ApplicationRecord
  belongs_to :robot
  validates :name, :number, presence: true
  validates :name, :number, uniqueness: true



# Instance Methods
def info
  if part_name == 'hammer'
    "Part: #{name} is part number: #{number}"
  elsif part_name == 'wrench'
    "Part: #{name} is part number: #{number}"
  elsif part_name == 'lag bolt'
    "Part: #{name} is part number: #{number}"
  elsif part_name == 'hex nut'
    "Part: #{name} is part number: #{number}"
  end
end

# Class Method
def self.by_name #this is a scope
  order(:name)
end

end
