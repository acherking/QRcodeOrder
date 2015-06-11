class Food < ActiveRecord::Base
  attr_accessible :name, :price, :food_type_id, :branch_id
  
  belongs_to :food_type
  has_many :little_menus
  belongs_to :little_menu
  has_one :branch
  
  validates :name, presence:true, length: { maximum: 50 }
  validates :price, presence:true
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates :food_type_id, presence:true
end
