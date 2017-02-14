FactoryGirl.define do
  factory :movie do
    title Faker::Book.title
    description Faker::Lorem.paragraph(4)
  end
end
