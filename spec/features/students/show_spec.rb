require 'rails_helper'

RSpec.describe 'Student Show Page' do
  describe 'on /student/:student_id' do
    it "has the student's name, age, cohort, and instructors" do
      student = create(:student, :with_instructors)
      visit "/students/#{student.id}"
      
      expect(page).to have_content(student.name)
      expect(page).to have_content(student.age)
      expect(page).to have_content(student.cohort)
      student.instructors.each do |instructor|
        expect(page).to have_link(instructor.name)
      end
    end
  end
end
