class Menu < ActiveRecord::Base
  attr_accessible :authentication_id, :statu, :updated_at
  
  belongs_to :authentication
  has_many :little_menus
  
  validates :authentication_id, presence:true
end
