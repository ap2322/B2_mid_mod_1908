require 'rails_helper'

RSpec.describe "Instructor Show Page" do
  describe "When I navigate to the instrtor show page from a student page" do
    it "has the instructor's name, a list of their students, and the average of
        all their student's ages" do
      instructor = create(:instructor, :with_students)
      student = instructor.students.first
      visit "/students/#{student.id}"

      click_link instructor.name

      expect(current_path).to eq "/instructors/#{instructor.id}"
      expect(page).to have_content(instructor.name)
      instructor.students.each do |student|
        expect(page).to have_content(student.name)
      end
      expect(page).to have_content("Average Age of #{instructor.name}'s Students: #{instructor.avg_student_age.round(0)}")
    end
  end
end
