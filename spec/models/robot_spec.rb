require 'rails_helper' #config file

RSpec.describe Robot, type: :model do
  describe 'associations' do
    it { should belong_to(:inventor) }
    it { should have_many :parts }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:serial_number) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:serial_number) }

    it do
      should validate_inclusion_of(:industry).
      in_array(['education', 'war', 'service', 'novelty'])
    end
  end

  describe 'instance methods' do
    describe '#bot' do
      it 'returns the bot message with name, serial number, color and industry.' do
        #Setup Code
        robot = Robot.create(name: 'TestRobot', serial_number: '10', color: 'orange', industry: 'education')
        # assertion / expection code
        expect(robot.bot).to eq("Robot: TestRobot with num: 10 is orange in Industry: education.")
      end
      it 'returns the bot message with name, serial number, color and industry.' do
        #Setup Code
        robot = Robot.create(name: 'TestRobot', serial_number: '10', color: 'orange', industry: 'war')
        # assertion / expection code
        expect(robot.bot).to eq("Robot: TestRobot with num: 10 is orange in Industry: war.")
      end

      it 'returns the bot message with name, serial number, color and industry.' do
        #Setup Code
        robot = Robot.create(name: 'TestRobot', serial_number: '10', color: 'orange', industry: 'service')
        # assertion / expection code
        expect(robot.bot).to eq("Robot: TestRobot with num: 10 is orange in Industry: service.")
      end

      it 'returns the bot message with name, serial number, color and industry.' do
        #Setup Code
        robot = Robot.create(name: 'TestRobot', serial_number: '10', color: 'orange', industry: 'novelty')
        # assertion / expection code
        expect(robot.bot).to eq("Robot: TestRobot with num: 10 is orange in Industry: novelty.")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'should returns the robot names alphabetically' do
        # setup code

      a = Inventor.create(name: 'Ali', hire_date: '2016-11-21', speciality: 'software')
        b1 = Robot.create(name: 'annie', serial_number: '111', industry: 'education', inventor_id: a.id)
        b2 = Robot.create(name: 'bobo', serial_number: '222', industry: 'war', inventor_id: a.id)
        b3 = Robot.create(name: 'c3', serial_number: '333', industry: 'service', inventor_id: a.id)
        b4 = Robot.create(name: 'r2d2', serial_number: '444', industry: 'novelty', inventor_id: a.id)

        # assertion / expectation code
        by_name = Robot.all.by_name

        expect(by_name[0].name).to eq(b1.name)
        expect(by_name[1].name).to eq(b2.name)
        expect(by_name[2].name).to eq(b3.name)
        expect(by_name[3].name).to eq(b4.name)
      end
    end
  end


end
