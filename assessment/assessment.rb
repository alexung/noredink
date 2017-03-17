# require_relative 'assessment/csv_parser'
require 'csv'

class Assessment

	def initialize(num_questions)
		@num_questions = num_questions.to_i
		check_num_questions
		retrieve_all_questions
	end

	def check_num_questions
		if @num_questions === 0
			puts 'Must have more questions.  Please try again!'
			return
		end
	end

	def retrieve_all_questions
		question_csv = CSV.read('questions.csv', headers: true)
		questions = []
		question_csv.map do |q|
			questions << q.to_h
		end
		distribute_questions_to_student(questions)
		return questions
	end

	def distribute_questions_to_student(questions)
		distributed_questions = []
		questions.map do |q|
			distributed_questions << questions.sample
			break if distributed_questions.length === @num_questions
		end
		puts distributed_questions
		return distributed_questions
	end

end