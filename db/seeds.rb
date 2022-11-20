# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

# Destroy all users
User.all.each(&:destroy)

# Create a new admin user
User.create_or_find_by!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password')

# Create a main sample user.
User.create_or_find_by!(email: 'user@user.com', password: 'password', password_confirmation: 'password')

# Exclude all posts
Post.all.each(&:destroy)

# Create 6 user
6.times do
  User.create_or_find_by!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

# Create 1 post for each user with a random number of comments from each user.
User.all.each do |user|
  post = Post.create_or_find_by!(title: Faker::Lorem.sentence(word_count: 3),
                                 content: Faker::Lorem.paragraph(sentence_count: 3), user:)
  rand(1..10).times do
    post.comments.create_or_find_by!(content: Faker::Lorem.paragraph(sentence_count: 3), user: User.all.sample)
  end
end
