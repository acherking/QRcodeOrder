class User < ActiveRecord::Base
	attr_accessible :name, :zhuachuan, :liangcai, :jiushui, :zhuchang, :chuancai, :huanzhuo, :maidan, :password,:password_confirmation
	
  before_create :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
