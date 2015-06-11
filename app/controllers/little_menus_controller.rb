# -*- encoding : utf-8 -*-
class LittleMenusController < ApplicationController
  before_action :set_little_menu, only: [:show, :edit, :update, :destroy, :update_chuancai, :update_zhunbei]
  skip_before_filter :verify_authenticity_token, :only => [:create, :destroy]
	before_action :valid_authentication, only: [:create, :destroy]
	before_action :signed_in_user, only: [:index, :show, :branch_little_menus, :chuancai_index, :update_zhunbei, :update_chuancai, :new, :edit, :update]

  # GET /little_menus
  # GET /little_menus.json
  def index
    @little_menus = LittleMenu.all
  end

  # GET /little_menus/1
  # GET /little_menus/1.json
  def show
  end

	# GEt /branch_little_menus/1
	def branch_little_menus
		@branch = Branch.find(params[:id])
		@menus_false = Menu.where(statu:false).limit(200).order(:updated_at)

		# 筛选出未准备的小单 little_menus_zhunbei_false
		l = @menus_false.length
    if l
      @little_menus_zhunbei_false = []
      i = 0
      while i < l do
        @little_menus_zhunbei_false = @little_menus_zhunbei_false + @menus_false[i].little_menus.where(zhunbei:false, chuancai:false).limit(50).order(:updated_at)
        i += 1
      end
      # 进一步筛选出该部门的小单 branch_little_menus_zhunbei_false 
      l = @little_menus_zhunbei_false.length
      if l
      	@branch_little_menus_zhunbei_false = []
      	i = 0
      	while i < l do
      		if Food.find(@little_menus_zhunbei_false[i].food_id).branch_id == @branch.id
      			@branch_little_menus_zhunbei_false << @little_menus_zhunbei_false[i]
      		end
      		i += 1
      	end
      end
      
    end
    
	end
	
	# GEt /chuancai_index
	def chuancai_index
		@menus_false = Menu.where(statu:false).limit(200).order(:updated_at)

		# 筛选出准备但还未传的小单 little_menus_zhunbei_false
		l = @menus_false.length
    if l
      @little_menus_zhunbei_true_chuancai_false = []
      i = 0
      while i < l do
        @little_menus_zhunbei_true_chuancai_false = @little_menus_zhunbei_true_chuancai_false + @menus_false[i].little_menus.where(zhunbei:true, chuancai:false).limit(50).order(:updated_at)
        i += 1
      end
    end
	
	end

	# PUT /update_little_menus_zhunbei/:id
	def update_zhunbei
		branch = Food.find(@little_menu.food_id).branch_id
		case branch # 身份认证
			when 1 # 吧台
				if !@current_user.jiushui && !@current_user.admin
					redirect_to root_path and return
				end
			when 2 # 后厨
				if !@current_user.zhuachuan && !@current_user.admin
					redirect_to root_path and return
				end
			when 3 # 凉菜
				if !@current_user.jiushui && !@current_user.admin
					redirect_to root_path and return
				end
			else
				flash[:error] = "无法准备该小单，没有对应的部门！"
				redirect_to root_path and return
		end
		
		if @little_menu.update(zhunbei:true)
      redirect_to '/branch_little_menus/'+branch.to_s
    else
    	flash[:error] = "准备失败！"
      redirect_to '/branch_little_menus/'+branch.to_s
    end
		
	end
	
	# PUT /update_little_menus_chuancai/:id
	def update_chuancai
		branch = Food.find(@little_menu.food_id).branch_id
		# 验证是否具备传菜权限
		if !@current_user.chuancai && !@current_user.admin
			redirect_to root_path and return
		end
		
		if @little_menu.update(chuancai:true)
      redirect_to '/chuancai_index'
    else
    	flash[:error] = "准备失败！"
      redirect_to '/chuancai_index'
    end
	
	end

  # GET /little_menus/new
  def new
    @little_menu = LittleMenu.new
  end

  # GET /little_menus/1/edit
  def edit
  end

  # POST /little_menus
  # POST /little_menus.json
  def create
    @menu = @current_authentication.menus.find_by_statu(true)
      
		if @menu
      @little_menu = LittleMenu.new(menu_id: @menu.id, food_id: params[:food_id], number: params[:number])
    else
      @menu = Menu.new(authentication_id: @current_authentication.id)
        if @menu.save
          @little_menu = LittleMenu.new(menu_id: @menu.id, food_id: params[:food_id], number: params[:number])
        else
          flash[:error] = "大菜单存储错误！"
        end
		end
      
    respond_to do |format|
      if @little_menu.save
        format.json { render json: @little_menu }
      else
        format.html
        format.json { render json: @little_menu.errors }
      end
    end
  end

  # PATCH/PUT /little_menus/1
  # PATCH/PUT /little_menus/1.json
  def update
    respond_to do |format|
      if @little_menu.update(little_menu_params)
        format.html { redirect_to @little_menu, notice: 'Little menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @little_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /little_menus/1
  # DELETE /little_menus/1.json
  def destroy
    @little_menu.destroy
    respond_to do |format|
      format.html { redirect_to little_menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_little_menu
      @little_menu = LittleMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def little_menu_params
      params.require(:little_menu).permit(:menu_id, :food_id, :number, :remark)
    end
end
