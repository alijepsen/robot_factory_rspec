require 'rails_helper' #config file

RSpec.describe Inventor, type: :model do
  describe 'associations' do
    it { should have_many(:robots)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hire_date) }

    it do
      should validate_inclusion_of(:speciality).
      in_array(['software', 'hardware', 'education', 'mad'])
    end
  end


  describe 'instance methods' do
    describe '#info' do
      it 'returns softie message and hire date if specialty software' do

      inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'software')

      expect(inventor.info).to eq("Softie: test hired on 2016-11-21 is in Speciality: software")
      end

      it 'returns hardware info message if speciality hardware' do
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'hardware')
        # assertion/expectation code
        expect(inventor.info).to eq("Hardy: test hired on 2016-11-21 is in Speciality: hardware")
      end

      it 'returns education info message if speciality education' do
        # Setup Code
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'education')
       expect(inventor.info).to eq("Smartie: test hired on 2016-11-21 is in Speciality: education")
      end

      it 'returns mad info message if speciality mad' do
       # Setup Code
       inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'mad')
        # assertion/expectation code
       expect(inventor.info).to eq("Madness: test hired on 2016-11-21 is in Speciality: mad")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'should returns the inventor names alphabetically' do
        # setup code
        b1 = Inventor.create(name: 'adam', hire_date: '2016-11-21', speciality: 'software')
        b2 = Inventor.create(name: 'amy', hire_date: '2016-11-21', speciality: 'hardware')
        b3 = Inventor.create(name: 'betsy', hire_date: '2016-11-21', speciality: 'education')
        b4 = Inventor.create(name: 'hannah', hire_date: '2016-11-21', speciality: 'mad')

        # assertion / expectation code
        by_name = Inventor.all.by_name

        expect(by_name[0].name).to eq(b1.name)
        expect(by_name[1].name).to eq(b2.name)
        expect(by_name[2].name).to eq(b3.name)
        expect(by_name[3].name).to eq(b4.name)
      end
    end
  end

end
