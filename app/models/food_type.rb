class FoodType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :foods
  
  validates :name, presence:true, length: { maximum: 50 }
end
