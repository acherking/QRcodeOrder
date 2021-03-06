module SessionsHelper
	
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def signed_in_user
  	redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def admin_or_zhuachuan_user
  	redirect_to(root_path) unless current_user.admin? || current_user.zhuachuan?
  end
  
  def admin_or_chuancai_user
  	redirect_to(root_path) unless current_user.admin? || current_user.chuancai?
  end
  
  def admin_or_huanzhuo_user
  	redirect_to(root_path) unless current_user.admin? || current_user.huanzhuo?
  end
  
  def admin_or_maidan_user
  	redirect_to(root_path) unless current_user.admin? || current_user.maidan?
  end
  
  def admin_or_liangcai_user
  	redirect_to(root_path) unless current_user.admin? || current_user.liangcai?
  end
  
  def admin_or_jiushui_user
  	redirect_to(root_path) unless current_user.admin? || current_user.jiushui?
  end
  
  def admin_or_zhuchang_user
  	redirect_to(root_path) unless current_user.admin? || current_user.zhuachuan?
  end
end
