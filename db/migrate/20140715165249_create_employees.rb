class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :badge_number
      t.belongs_to :location
      t.timestamps
    end

    add_index :employees, :location_id
  end
end
