# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Like.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating Users..."
5.times do |i|
  User.create!(
    name: "User #{i + 1}"
  )
end

all_users = User.all.to_a

puts "Creating Posts..."
50.times do |i|
  Post.create!(
    title: "Post #{i + 1}",
    body: "This is the content of post #{i + 1}.",
    user: all_users.sample
  )
end

all_posts = Post.all.to_a

puts "Creating likes..."
500.times do
  Like.find_or_create_by!(
    user: all_users.sample,
    post: all_posts.sample
  )
end

puts "Database seeded successfully!"
puts "Created #{User.count} Users, #{Post.count} Posts, and #{Like.count} Likes."
