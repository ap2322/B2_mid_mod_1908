class Student < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cohort
  validates_presence_of :age
  
  has_many :instructor_students
  has_many :instructors, through: :instructor_students

end
