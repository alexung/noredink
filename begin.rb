require_relative 'assessment/assessment'

# puts 'You are about to enter the most fulfilling challenge of your life'

# puts 'Who are you? '
# name = gets

puts "Get ready to be quizzified - How many questions are you up for?: "
num_questions = gets

Assessment.new(num_questions)