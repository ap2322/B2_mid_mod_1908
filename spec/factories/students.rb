FactoryBot.define do
  factory :student do
    cohort { 1908 }
    age { 28 }
    sequence :name do |i|
      "Student Name #{i}"
    end

    trait :with_instructors do
      transient do
        instructor_count { 2 }
      end
      after(:create) do |student, evaluator|
        student.instructors << create_list(:instructor, evaluator.instructor_count)
      end
    end
  end
end
