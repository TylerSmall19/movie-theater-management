FactoryGirl.define do
  factory :order do
    name Faker::Name.name
    email Faker::Internet.email
    credit_card CreditCardValidations::Factory.random(:visa)
    expiration Time.now
    showtime
  end
end
