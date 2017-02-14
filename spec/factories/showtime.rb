FactoryGirl.define do
  factory :showtime do
    movie
    screen
    time Time.now
  end
end
