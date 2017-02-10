class CreateMealIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_ingredients do |t|
      t.belongs_to :meal
      t.belongs_to :ingredient
      t.string :amount

      t.timestamps
    end
  end
end
