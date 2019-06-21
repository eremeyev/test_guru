# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "-- Create Categories"
categories = []
categories << Category.find_or_create_by(title: 'Front end')
categories << Category.find_or_create_by(title: 'Back end')
categories << Category.find_or_create_by(title: 'Hardware programming')
categories << Category.find_or_create_by(title: 'Operating systems')

puts "-- Create Users"
users = []
users << User.find_or_create_by(login: 'john_doe', password: '123456', email: 'john_doe@example.com', first_name: 'John', last_name: 'Doe')
users << User.find_or_create_by(login: 'foo_bar', password: '123456', email: 'foo_bar@example.com', first_name: 'Foo', last_name: 'Bar')


puts "-- Create Tests"
tests = []
tests << Test.find_or_create_by(title: "Rails", level: 0, category_id: categories[0].id, author_id: users[0].id)
tests << Test.find_or_create_by(title: "Rails", level: 1, category_id: categories[0].id, author_id: users[0].id)
tests << Test.find_or_create_by(title: "Ruby",  level: 0, category_id: categories[1].id, author_id: users[1].id)
tests << Test.find_or_create_by(title: "HTML",  level: 5, category_id: categories[2].id, author_id: users[1].id)
tests << Test.find_or_create_by(title: "CSS",   level: 7, category_id: categories[3].id, author_id: users[1].id)

puts "-- Create Questions"
questions = []
questions << Question.find_or_create_by(test_id: tests[0].id, body: 'What is View ?')
questions << Question.find_or_create_by(test_id: tests[1].id, body: 'What is Model ?')

puts "-- Connect users and tests"
tests[0].users << users[0]
tests[0].author = users[1]
tests[0].save

puts "-- Create Answers"
Answer.find_or_create_by(question_id: questions[0].id, user_id: users[0].id, body: 'View is what we see in browser', correct: true)
Answer.find_or_create_by(question_id: questions[1].id, user_id: users[1].id, body: 'Model is table', correct: false)