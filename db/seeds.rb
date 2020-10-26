require 'faker'
Faker::Config.locale = :fr

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
JoinTableTagGossip.destroy_all
LierPrivateMessageUser.destroy_all

#Cities

10.times do
  city_and_zip = Faker::Address.full_address.split(', ').last
  zip = city_and_zip.split(' ').first
  city_name = city_and_zip.split(' ').last
  City.create(name: city_name, zip_code: zip)
end
puts
puts "Cities table"
tp City.all
#Users
adjectifs= %w[petit grand maigre gros chauve muscle intelligent parfait mediocre insupportable eblouissant valeureux]
10.times do 
  first_name = Faker::Name.first_name
  age = rand(18..90)
  city = City.all.sample
   text = "Je m'appelle #{first_name}, je suis #{adjectifs.sample} et mon livre préféré est #{Faker::Book.title}, je suis #{Faker::Name.title[:job].sample} à #{city.name} "
  User.create(first_name: first_name, last_name: Faker::Name.last_name ,description: text, email: Faker::Internet.email, age: age, city: city )

end
puts
puts "Users table"
tp User.all

#Gossips
20.times do 
  Gossip.create(title: Faker::Hipster.word, content: Faker::ChuckNorris.fact, user: User.all.sample )
  
end
puts
puts "Gossips table"
tp Gossip.all

#Tags 
10.times do
  Tag.create(title: Faker::Verb.base)
end
puts
puts "Cities table"
tp Tag.all

Tag.all.each do |t|
  JoinTableTagGossip.create(tag: t, gossip: Gossip.all.sample)
end

Gossip.all.each do |g|
  JoinTableTagGossip.create(tag: Tag.all.sample, gossip: g)
end

puts
puts "JoinTableTagGossip table"
tp JoinTableTagGossip.all

#Private messages
10.times do
  PrivateMessage.create(content:Faker::Lorem.sentence,sender: User.all.sample)
end
puts
puts "Private messages table"
tp PrivateMessage.all

#Lier private_messages_users
User.all.each do |u|
  LierPrivateMessageUser.create(user: u, private_message: PrivateMessage.all.sample)
end

PrivateMessage.all.each do |pm|
  LierPrivateMessageUser.create(user: User.all.sample, private_message: pm)
end

puts
puts "Lier private message et users table"
tp LierPrivateMessageUser.all