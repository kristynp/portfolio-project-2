class CreatePlants < ActiveRecord::Migration
  create_table :plants do |t|
    t.string :name
    t.string :sunlight
    t.string :water
    t.integer :user_id
  end
end
