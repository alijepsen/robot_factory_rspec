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

class Robot < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :inventor
  validates :name, :serial_number, presence: true
  validates :name, :serial_number, uniqueness: true
  validates :industry, inclusion: {
    in: %w(education war service novelty),
    message: "NOPE!"
  }, allow_nil: true


# Instance Methods
  def bot
    if industry == 'education'
      "Robot: #{name} with num: #{serial_number} is #{color} in Industry: #{industry}."
    elsif  industry == 'war'
      "Robot: #{name} with num: #{serial_number} is #{color} in Industry: #{industry}."
    elsif industry == 'service'
      "Robot: #{name} with num: #{serial_number} is #{color} in Industry: #{industry}."
    elsif industry == 'novelty'
      "Robot: #{name} with num: #{serial_number} is #{color} in Industry: #{industry}."
    end
  end


# Class Method
  def self.by_name #this is a scope
    order(:name)
  end


private
  def serialnum
    self.serial_number = '10'
  end

  def color
    self.color = 'orange'
  end

end


