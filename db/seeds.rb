require 'ffaker'

40.times do |i|
  MenuItem.create({
    name: Faker::Name.name,
    price: rand(15).to_f,
    description: Faker::BaconIpsum.paragraph,
    vegetarian: (i % 10 == 0)
  })
end
