class UsersController < ApplicationController
	before_action :signed_in_user
	before_action :admin_user,     only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
  	@users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
private

	def user_params
  	params.require(:user).permit(:name, :zhuachuan, :chuancai, :huanzhuo, :maidan, :liangcai, :jiushui, :zhuchang, :password, :password_confirmation)
  end
end
