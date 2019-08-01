# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'time'

DatabaseCleaner.clean_with(:truncation)

100.times do
  # Create cities
  city = Faker::Address.city
  City.create(city_name: city)
end

breeds = [
  'Chihuahua',
  'Labrador',
  'Bulldog',
  'Golden Retriever',
  'Beagle',
  'Yorkshire Terrier',
  'Doberman',
  'Husky',
  'Cocker',
  'German Shepherd',
  'Poodle',
  'Boxer',
  'Great Dane',
  'Shih Tzu',
  'Shiba-Inu'
]

# Create dogs
1000.times do
  name = Faker::FunnyName.two_word_name.split(' ')[0]
  city = City.all.sample
  breed = breeds.sample
  Dog.create(name: name, city: city, breed: breed)
end

# Create dogsitters
300.times do
  name = Faker::FunnyName.two_word_name
  city = City.all.sample
  Dogsitter.create(name: name, city: city)
end

# Create strolls
5000.times do
  city = City.all.sample
  dogsitter = Dogsitter.where('city_id = ?', city.id).sample
  dogs = Dog.where('city_id = ?', city.id)
  date = Time.at((rand+1)*Time.now.to_i)
  if dogs.length > 0
    num_dogs = [dogs.length, rand(1..3)].min
    stroll = Stroll.create(date: date, dogsitter: dogsitter)
    stroll.dogs.push(*dogs.sample(num_dogs))
  end
end
