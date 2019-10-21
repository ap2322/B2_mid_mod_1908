class Instructor < ApplicationRecord
  validates_presence_of :name

  has_many :instructor_students
  has_many :students, through: :instructor_students

  def avg_student_age
    students.average(:age)
  end
end
