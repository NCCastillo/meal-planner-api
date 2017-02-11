class CreateMealIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_ingredients do |t|
      t.belongs_to :meal, foreign_key: true, index: true
      t.belongs_to :ingredient, foreign_key: true, index: true
      t.string :amount

      t.timestamps
    end
  end
end
