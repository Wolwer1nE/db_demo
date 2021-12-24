# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
return if User.any? || !Rails.env.development?

#not safe, only for dev purpose!!!
default_password_digest = '24hfornjav 4ngrv'
a = User.create!(name: 'A', password_digest: default_password_digest, access_level: 3)
b = User.create!(name: 'B', password_digest: default_password_digest, access_level: 1)
c = User.create!(name: 'C', password_digest: default_password_digest, access_level: 0)

task = Task.create(title: 'Seed task', description: 'Test Task Description', creator: a)
b.assignments << Assignment.new(task: task)
b.save!
c.assignments << Assignment.new(task: task)
c.save!

task.review = Review.create(text: 'Well done', reviewer: a)