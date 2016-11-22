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

class Inventor < ApplicationRecord
  has_many :robots, dependent: :destroy
  validates :name, :hire_date, presence: true
  validates :speciality, inclusion: {
    in: %w(software hardware education mad),
    message: "Not valid"
  }, allow_nil: true


# Instance Methods
def info
  if speciality == 'software'
    "Softie: #{name} hired on #{hire_date} is in Speciality: #{speciality}"
  elsif  speciality == 'hardware'
    "Hardy: #{name} hired on #{hire_date} is in Speciality: #{speciality}"
  elsif speciality == 'education'
    "Smartie: #{name} hired on #{hire_date} is in Speciality: #{speciality}"
  elsif speciality == 'mad'
    "Madness: #{name} hired on #{hire_date} is in Speciality: #{speciality}"
  end
end

# Class Method
def self.by_name #this is a scope
  order(:name)
end

  private
    def hire
      self.hire_date = Date.today
    end

end
