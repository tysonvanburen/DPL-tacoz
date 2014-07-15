class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :menu_item
      t.string :name
      t.integer :calories
      t.timestamps
    end

    add_index :ingredients, :menu_item_id
  end
end
