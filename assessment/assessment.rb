# require_relative 'assessment/csv_parser'
require 'csv'

class Assessment

	def initialize(num_questions)
		@num_questions = num_questions.to_i
		check_num_questions
		puts retrieve_questions

	end

	def check_num_questions
		if @num_questions === 0
			puts 'Must have more questions.  Please try again!'
			return
		end
	end

	def retrieve_questions
		question_csv = CSV.table('questions.csv', headers: true)
		questions = []
		question_csv.map do |q|
			questions << q.to_h
			break if questions.length === @num_questions
		end
		return questions
	end


end