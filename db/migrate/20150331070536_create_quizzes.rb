class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|

      t.text "First_question", :limit => 400

      t.timestamps null: false
    end
  end
end
