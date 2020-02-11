class CreatePlantPots < ActiveRecord::Migration
  create_table :plant_pots do |t|
    t.string :color
    t.string :size
    t.integer :plant_id
  end
end
