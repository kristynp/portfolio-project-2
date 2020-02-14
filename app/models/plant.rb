class Plant < ActiveRecord::Base
  belongs_to :user
  has_one :plant_pot
end
