class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.float :price, default: 0.0
      t.text :description
      t.boolean :vegetarian, default: false
      t.string :picture
      t.timestamps
    end

    add_index :menu_items, :vegetarian
  end
end
