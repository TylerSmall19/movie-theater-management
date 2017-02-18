FactoryGirl.define do
  factory :showtime do
    movie
    screen
    time  Time.now
    price 10.00
  end
end
