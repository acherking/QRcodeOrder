class LittleMenu < ActiveRecord::Base
  attr_accessible :menu_id, :food_id, :number, :remark
  
  has_one :food
  belongs_to :food
  belongs_to :menu
  
  validates :menu_id, presence:true
  validates :food_id, presence:true
  validates_numericality_of :number, :greater_than => 0
end
