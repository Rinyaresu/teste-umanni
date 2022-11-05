# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

# Create 10 posts

# exclude all posts
Post.all.each(&:destroy)

15.times do
  Post.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  )
end
