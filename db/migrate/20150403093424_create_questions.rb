class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.integer :survey_id
      t.text :content

      t.timestamps null: false
    end
  end

  def down
  	drop_table :questions
  end
end
