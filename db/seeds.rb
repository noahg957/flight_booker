# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
airports = ['ATL', 'LAX', 'ORD', 'DFW', 'DEN', 'JFK', 'SFO', 'SEA', 'LAS', 'MCO', 'EWR', 'CLT', 
'PHX', 'IAH', 'MIA', 'BOS', 'MSP', 'FLL', 'DTW', 'PHL', 'LGA', 'BWI', 'SLC', 'SAN', 'IAD', 'DCA', 'MDW', 'TPA', 'PDX', 'HNL']

airports.each do |airport_code|
  Airport.create(code: airport_code)
end

i = 0

Flight.delete_all
while i < 1000
  first_random_number = rand(0...30)
  second_random_number = rand(0...30)
  random_date = Faker::Time.forward(days: 365)
  while first_random_number == second_random_number
    second_random_number = rand(0...30)
  end
  Flight.create(from_airport_id: Airport.find_by_code(airports[first_random_number]).id, to_airport_id: Airport.find_by_code(airports[second_random_number]).id, departure_time: random_date)
  i += 1
end