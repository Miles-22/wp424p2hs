class GodHand < ActiveRecord::Migration
	def change
		create_table "assignment_questions", :force => true do |t|
			t.string   "question_number"
			t.string   "assignment_number"
		end

	  create_table "assignments", :force => true do |t|
		t.string   "assignment_number"
		t.string   "due_date"
		t.string   "description"
		t.string   "date_assigned"
		t.string   "assignment_name"
		t.string   "course_number"
	  end

	  create_table "enrollments", :force => true do |t|
		t.string   "department"
		t.string   "level"
		t.string   "semester"
		t.string   "student_number"
		t.string   "user_number"
	  end

	  create_table "instructors", :force => true do |t|
		t.string   "instructor_number"
		t.string   "user_id"
	  end

	  create_table "questions", :force => true do |t|
		t.string   "hint"
		t.string   "correct_answer"
		t.string   "prompt"
		t.string   "answer_type"
	  end

	  create_table "students", :force => true do |t|
		t.string   "user_id"
		t.string   "student_number"
	  end

	  create_table "teaching_courses", :force => true do |t|
		t.string   "department"
		t.string   "level"
		t.string   "semester"
		t.string   "instructor"
	  end
	  
		create_table "users", :force => true do |t|
			t.string   "username"
			t.string   "email"
			t.string   "encrypted_password"
			t.string   "salt"
			t.string   "first_name"
			t.string   "last_name"
		end
	end
end
