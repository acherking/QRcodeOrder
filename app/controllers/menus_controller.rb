class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
	before_action :valid_authentication, only: [:index, :update]

  # GET /menus
  # GET /menus.json
  def index
    @menus = @current_authentication.menus.order(:updated_at)
    @foods = Food.all
    
    l = @menus.length
    if l
      @menus_false = []
      @little_menus_false = []
      i = 0
      while i < l do
        if @menus[i].statu == false
          @menus_false[i] = @menus[i]
          @little_menus_false[i] = @menus[i].little_menus
        else
          @menus_true = @menus[i]
          @little_menus_true = @menus[i].little_menus
        end
        i += 1
      end    
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html {}
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
			if @menu.little_menus.length > 0
				if @menu.update(menu_params)
					
					@menus = @current_authentication.menus.order(:updated_at)
					@foods = Food.all
			
					l = @menus.length
					if l
						@menus_false = []
						@little_menus_false = []
						i = 0
						while i < l do
							if @menus[i].statu == false
								@menus_false[i] = @menus[i]
								@little_menus_false[i] = @menus[i].little_menus
							else
								@menus_true = @menus[i]
								@little_menus_true = @menus[i].little_menus
							end
							i += 1
						end    
					end
					
					format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
					format.js {}
					format.json { head :no_content }
				else
					format.html { render action: 'edit' }
					format.json { render json: @menu.errors, status: :unprocessable_entity }
				end
			#大菜单中小单数量为0
			else
				@menus = @current_authentication.menus.order(:updated_at)
				@foods = Food.all
		
				l = @menus.length
				if l
					@menus_false = []
					@little_menus_false = []
					i = 0
					while i < l do
						if @menus[i].statu == false
							@menus_false[i] = @menus[i]
							@little_menus_false[i] = @menus[i].little_menus
						else
							@menus_true = @menus[i]
							@little_menus_true = @menus[i].little_menus
						end
						i += 1
					end    
				end
				
				format.html {}
				format.js {}
				format.json { head :no_content }
			end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:authentication_id, :statu)
    end
end
