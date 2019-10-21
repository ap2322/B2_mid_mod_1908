FactoryBot.define do
  factory :instructor do
    sequence :name do |i|
      "Instrctor Name #{i}"
    end

    trait :with_students do
      transient do
        student_count { 15 }
      end
      after(:create) do |instructor, evaluator|
        instructor.students << create_list(:student, evaluator.student_count)
      end
    end
  end
end
