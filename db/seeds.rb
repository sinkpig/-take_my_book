# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Deleting books and user'
User.destroy_all
Book.destroy_all
puts 'End'
puts 'Creating a user 1'
User.create(name: "Juju", email: "test@test.com", password: "123123", password_confirmation: "123123", address: "Rua 123")
puts 'End'
puts 'Creating a user 2'
User.create(name: "Dani", email: "teste@teste.com", password: "123123", password_confirmation: "123123", address: "Rua 234")
puts 'End'
puts 'Creating a user 3'
User.create(name: "Milo", email: "a@a.com", password: "123123", password_confirmation: "123123", address: "Rua 345")
puts 'End'
puts 'Creating 10 Books'
10.times do
  book = Book.new(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year: (1900..2022).to_a.sample,
    genre: %w[fantasy dystopian adventure romance horror thriller children].sample,
    user_id: 1
  )
  book.save!
end
puts 'End'
puts 'Creating 5 Books'
5.times do
  book2 = Book.new(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year: (1900..2022).to_a.sample,
    genre: %w[fantasy dystopian adventure romance horror thriller children].sample,
    user_id: 3
  )
  book2.save!
end
puts 'End'
