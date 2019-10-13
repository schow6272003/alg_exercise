# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.all.destroy_all

100.times do |i|
   url =  "https://aws.photo-" + i.to_s + ".jpeg"
   name =  "photo " + i.to_s
   user_id = 5
   Photo.create(:user_id => user_id, :name => name, :url => url)
end
