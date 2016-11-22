require 'rails_helper' #config file

RSpec.describe Part, type: :model do
  describe 'associations' do
    it { should belong_to(:robot) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:number) }
  end

# Instance Methods
  describe 'class methods' do
    describe '.by_name' do
      it 'returns the part name in alpha order' do
        # setup code
        a = Inventor.create(name: 'Ali', hire_date: '2016-11-21', speciality: 'software')
        r = Robot.create(name: 'Bobo', serial_number: '9999', industry: 'war', inventor_id: a.id)
        p1 = Part.create(name: 'hammer', number: '1010', robot_id: r.id)
        p2 = Part.create(name: 'wrench', number: '1555', robot_id: r.id)
        p3 = Part.create(name: 'lag bolt', number: '2022', robot_id: r.id)
        p4 = Part.create(name: 'hex nut', number: '3033', robot_id: r.id)

        # assertion / expectation code
        by_name = Part.all.by_name
        expect(by_name[0].name).to eq(p1.name)
        expect(by_name[1].name).to eq(p4.name)
        expect(by_name[2].name).to eq(p3.name)
        expect(by_name[3].name).to eq(p2.name)
      end
    end
  end

end
