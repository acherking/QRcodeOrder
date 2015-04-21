class Authentication < ActiveRecord::Base
  attr_accessible :authentication_str, :table_id, :statu
  
  has_one :table
  has_many :menus
  
  validates :authentication_str, presence:true, length: { maximum: 50 }
  validates :table_id, presence:true
  validates :statu, presence:true
end
