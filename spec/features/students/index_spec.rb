require 'rails_helper'

RSpec.describe "Student Index Page" do
  describe 'When I visit /students' do
    it 'has each student in the system with their name, cohort, and instructor' do
      student1 = create(:student, :with_instructors, name: "Bob J")
      student2 = create(:student, :with_instructors, name: "Jim B")
      visit '/students'

      expect(page).to have_content("Bob J")
      expect(page).to have_content("#{student1.cohort}")
      student1.instructors.each do |instructor|
        expect(page).to have_content("#{instructor.name}")
      end

      expect(page).to have_content("Jim B")
      expect(page).to have_content("#{student2.cohort}")
      student1.instructors.each do |instructor|
        expect(page).to have_content("#{instructor.name}")
      end
    end
  end
end
