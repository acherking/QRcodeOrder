# -*- encoding : utf-8 -*-
class LittleMenusController < ApplicationController
  before_action :set_little_menu, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /little_menus
  # GET /little_menus.json
  def index
    @little_menus = LittleMenu.all
  end

  # GET /little_menus/1
  # GET /little_menus/1.json
  def show
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
    @authentication = Authentication.find_by_authentication_str(params[:authentication_str])
    
    if @authentication
      @menu = @authentication.menus.find_by_statu(true)
      
      if @menu
        @little_menu = LittleMenu.new(menu_id: @menu.id, food_id: params[:food_id], number: params[:number])
      else
        @menu = Menu.new(authentication_id: @authentication.id)
          if @menu.save
            @little_menu = LittleMenu.new(menu_id: @menu.id, food_id: params[:food_id], number: params[:number])
          else
            flash[:error] = "菜单存储错误！"
          end
      end
    else 
      flash[:error] = "没有认证！请扫描桌上二维码！"
      redirect_to root_path
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
