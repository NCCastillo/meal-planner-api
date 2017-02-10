class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.text :direction
      t.string :name

      t.timestamps
    end
  end
end
