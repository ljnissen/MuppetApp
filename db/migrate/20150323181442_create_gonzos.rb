class CreateGonzos < ActiveRecord::Migration
  def change
    create_table :gonzos do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
