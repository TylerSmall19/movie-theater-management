FactoryGirl.define do
  factory :theater do
    address Faker::Address.street_address
    name    Faker::Company.name
  end
end
