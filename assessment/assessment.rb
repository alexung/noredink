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

		distributed_questions_ids = []
		strand_1_count = 0
		strand_2_count = 0
		until distributed_questions_ids.length === @num_questions
			if strand_1_count > strand_2_count 
				q = question.sample
				q = question.sample if q["strand_id"] != 1
				distributed_questions_ids << q["question_id"]
				strand_1_count+=1
			elsif strand_1_count < strand_2_count
				q = question.sample
				q = question.sample if q["strand_id"] != 2
				distributed_questions_ids << q["question_id"]
				strand_2_count+=1
			else
				distributed_questions_ids << questions.sample["question_id"]
			end
		end

		print distributed_questions_ids
		return distributed_questions_ids
	end

end