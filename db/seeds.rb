# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create a Foo
100.times.each do |i|
  Foo.create!(
    name: Faker::Name.name,
    time: Faker::Time.between(from: Time.now - 100.years, to: Time.now),
    checked: Faker::Boolean.boolean,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    status: Foo.status.values.sample
  )

  rand(0..10).times.each do |j|
    Bar.create!(
      foo: Foo.last,
      name: Faker::Name.name,
      descriptions: Faker::Lorem.paragraph
    )
  end
end
