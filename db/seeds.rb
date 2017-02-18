Order.destroy_all
Showtime.destroy_all
Screen.destroy_all
Theater.destroy_all
Ticket.destroy_all
Movie.destroy_all

Theater.create!(
  address: Faker::Address.street_address,
  name: Faker::Company.name
)

20.times do
  Movie.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(4)
  )
end

10.times do |x|
  Screen.create!(
    number: x + 1,
    capacity: [100, 150, 125, 135, 175].sample,
    theater: Theater.first,
    movie: Movie.all[x]
  )
end

Movie.all.each do |movie|
  5.times do |x|
    Showtime.create!(
      movie: movie,
      time: Time.now,
      screen: Screen.all[x],
      price: 10.0
    )
  end
end

Showtime.all.each do |showtime|
  # Random mix of seats open/Sold out
  cap = showtime.screen.capacity
  rand(cap + 1).times do
    showtime.orders.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      credit_card: CreditCardValidations::Factory.random(:visa),
      expiration: Time.now
    )
  end
end
