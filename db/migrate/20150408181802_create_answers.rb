class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
    	t.integer :question_id
    	t.string :content

      t.timestamps null: false
    end
  end

  def down
  	drop_table :answers
  end
end
