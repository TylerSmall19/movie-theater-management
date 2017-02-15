20.times do
  Movie.create!(title: Faker::Book.title, description: Faker::Lorem.paragraph(4))
end
