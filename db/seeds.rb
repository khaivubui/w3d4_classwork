# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all

user1 = User.create(username: "Mikhail")
user2 = User.create(username: "Khai")
user3 = User.create(username: "Daenerys Targaryen")

poll1 = Poll.create(user_id: 1, title: "Daenerys Targaryen")
poll2 = Poll.create(user_id: 2, title: "Jon Snow")

poll1_question1 = Question.create(poll_id: 1, text: "Is Dany hot?")

poll2_question1 = Question.create(poll_id: 2, text: "When is Jon going to nail the dragon?")
poll2_question2 = Question.create(poll_id: 2, text: "When is Jon going to kill the Night King?")

p1_q1_ac1 = AnswerChoice.create(question_id: 1, text: "Yes.")
p1_q1_ac2 = AnswerChoice.create(question_id: 1, text: "No.")


p2_q1_ac1 = AnswerChoice.create(question_id: 2, text: "Ep. 6")
p2_q1_ac2 = AnswerChoice.create(question_id: 2, text: "NEVER!")

p2_q2_ac1 = AnswerChoice.create(question_id: 3, text: "Ep. 8")
p2_q2_ac2 = AnswerChoice.create(question_id: 3, text: "NEVER!")

response1 = Response.create(user_id: 2, answer_choice_id: 1)
response2 = Response.create(user_id: 1, answer_choice_id: 4)
response3 = Response.create(user_id: 3, answer_choice_id: 5)
