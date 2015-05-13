class CreateGuesses < ActiveRecord::Migration
  def up
    create_table :guesses do |t|
      t.boolean :guesswork

      t.timestamps null: false
    end
  end

  def down
  	drop_table :guesses
  end	
end
