class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :menu_option
      t.belongs_to :meal, foreign_key: true, index: true
      t.belongs_to :menu, foreign_key: true, index: true
      t.string :day

      t.timestamps
    end
  end
end
