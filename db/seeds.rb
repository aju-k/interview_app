# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..200).each do |id|
  Link.create(original_link: Faker::Internet.url, unique_code: UniqueCodeMethods.generate_unique_code(id), visit_count: Random.rand(1000))
end

