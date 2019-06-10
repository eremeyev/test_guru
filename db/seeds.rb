# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.find_or_create_by(title: 'Front end')
Category.find_or_create_by(title: 'Back end')
Category.find_or_create_by(title: 'Hardware programming')
Category.find_or_create_by(title: 'Operating systems')

test1 = Test.find_or_create_by(title: "Rails", level: 0, category_id: 1)
test2 = Test.find_or_create_by(title: "Rails", level: 1, category_id: 1)
test3 = Test.find_or_create_by(title: "Ruby",  level: 0, category_id: 2)
test4 = Test.find_or_create_by(title: "HTML",  level: 0, category_id: 3)
test5 = Test.find_or_create_by(title: "CSS",   level: 0, category_id: 4)

question1 = Question.find_or_create_by(test_id: test1.id, body: 'What is View ?')
user1 = User.find_or_create_by(login: 'john_doe', password: '123456', email: 'john_doe@example.com', first_name: 'John', last_name: 'Doe')
user2 = User.find_or_create_by(login: 'foo_bar', password: '123456', email: 'foo_bar@example.com', first_name: 'Foo', last_name: 'Bar')

user1.tests << test1
user1.tests << test2
user1.tests << test3
user2.tests << test4
user2.tests << test5

Answer.create(question_id: question1.id, user_id: user1.id, body: 'View is what we see in browser', correct: 'Yes')
