FactoryBot.define do
  factory :student do
    cohort { 1908 }
    sequence(:age, 18) { |i| i }
    sequence :name {|i| "Student Name #{i}" }

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
