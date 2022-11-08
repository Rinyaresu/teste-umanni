# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

# Create a main sample user.
User.create_or_find_by!(email: 'user@user.com', password: 'password', password_confirmation: 'password')

# Create a user
User.create_or_find_by!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')

# Exclude all posts
Post.all.each(&:destroy)

# Create 15 posts
15.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user_id: User.first.id
  )
end
