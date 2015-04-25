class Table < ActiveRecord::Base
  attr_accessible :name, :statu
  
  belongs_to :authentication
  
  validates :name, presence:true, length: { maximum: 50 }
  validates :statu, presence:true
end
