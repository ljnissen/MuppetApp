class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      
      t.text "First_answer", :string, :limit => 250
      t.string "Second_answer", :limit => 300
      t.string "Third_answer", :limit => 300
      t.string "Fourth_answer", :limit => 300
      t.string "Fifth_answer", :limit => 350
      t.string "Sixth_answer", :limit => 350
      
      #t.datetime "created_at"
      #t.datetime "updated_at"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :answers
  end
end
