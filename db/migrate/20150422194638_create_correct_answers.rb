class CreateCorrectAnswers < ActiveRecord::Migration
  def up
    create_table :correct_answers do |t|
    	t.integer :question_id
    	t.boolean :guess
      	t.timestamps null: false
    end
  end

  def down
  	drop_table :correct_answers
  end
end
