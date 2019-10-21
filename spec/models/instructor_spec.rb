require 'rails_helper'

RSpec.describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it {should have_many :instructor_students}
    it {should have_many(:students).through(:instructor_students)}
  end

  describe 'methods' do
    it 'finds the average age of all students of one instructor' do
      instructor = create(:instructor, :with_students)
      other_students = create_list(:student, 3)

      expect(instructor.avg_student_age).to eq 43
      expect(Student.all.average(:age)).to eq 44.5
    end
  end
end
