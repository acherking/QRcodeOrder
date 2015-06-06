class Table < ActiveRecord::Base
  attr_accessible :name, :statu, :authentication_id
  
  belongs_to :authentication
  
  validates :name, presence:true, length: { maximum: 50 }
  validates :authentication_id, presence:true
end
