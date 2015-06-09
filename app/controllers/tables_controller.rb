class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /tables
  # GET /tables.json
  def index
		@tables = Table.where(statu:false).limit(60)
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  	@authentication = Authentication.find_by(id: @table.authentication_id)
  	if @authentication.statu == false
  		flash[:error] = "无效的认证码！"
  		redirect_to tables_path
  	end
  	@menus = @authentication.menus.order(:updated_at)
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

  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render action: 'show', status: :created, location: @table }
      else
        format.html { render action: 'new' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :statu)
    end
    
    
end
