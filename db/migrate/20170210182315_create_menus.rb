class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.string :week_of

      t.timestamps
    end
  end
end
