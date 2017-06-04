# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create!(
    name: Faker::Name.unique.name,
    uname: Faker::Internet.unique.user_name(5..8),
    email: Faker::Internet.unique.safe_email,
    password: Faker::Internet.password(10, 20)
  )
end
users = User.all

# standard user for testing purpose
User.create!(
  name: Faker::Name.unique.name,
  uname: 'standard',
  email: Faker::Internet.unique.safe_email,
  password: 'helloworld'
)

10.times do
  Topic.create!(
    title: Faker::Book.title,
    user: users.sample
  )
end
topics = Topic.all

100.times do
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample
  )
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
