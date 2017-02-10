class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.belongs_to :user
      t.belongs_to :meal
      t.string :week_of
      t.string :day

      t.timestamps
    end
  end
end
