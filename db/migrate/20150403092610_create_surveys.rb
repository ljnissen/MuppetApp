class CreateSurveys < ActiveRecord::Migration
  def up
    create_table :surveys do |t|
      t.string :name
      #t.integer :questions_id

      t.timestamps null: false
    end
  end

  def down
  	drop_table :surveys
  end
end
