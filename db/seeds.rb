require 'faker'


User.all.destroy_all
Photo.all.destroy_all
Favorite.all.destroy_all
Connection.all.destroy_all


10.times do |i|
   User.create(:first_name => Faker::Name.unique.first_name, :last_name => Faker::Name.unique.last_name, :email => Faker::Internet.unique.email)
end 


User.all.each do |u|
   rand(1..20).times do |i|
      u.photos.build(:url => "https://picsum.photos/200", :name => Faker::FunnyName.name).save!
   end 
end 



