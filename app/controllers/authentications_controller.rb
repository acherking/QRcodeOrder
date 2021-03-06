class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :edit_table, :update, :update_statu, :update_table, :destroy]
  before_action :signed_in_user
  before_action :admin_user, only: [:create, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = Authentication.all
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
  end

  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end

  # GET /authentications/1/edit
  def edit
  end

  # POST /authentications
  # POST /authentications.json
  def create
    @authentication = Authentication.new(authentication_params)

    respond_to do |format|
      if @authentication.save
        format.html { redirect_to @authentication, :flash => { :success => '认证码创建成功！' } }
        format.json { render action: 'show', status: :created, location: @authentication }
      else
        format.html { render action: 'new' }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authentications/1
  # PATCH/PUT /authentications/1.json
  def update
    respond_to do |format|
      if @authentication.update(authentication_params)
        format.html { redirect_to @authentication, :flash => { :success => '认证码更新成功！' } }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /update_statu/1
  def update_statu
  	admin_or_maidan_user
  	@table = Table.find_by(id: @authentication.table_id)
  	respond_to do |format|
  		if @authentication.statu
      	if @authentication.update(statu: false) && @table.update(statu: true, authentication_id: 1)
        	format.html { redirect_to tables_path, :flash => { :success => '买单成功！' } }
        	format.json { head :no_content }
      	else
        	format.html { redirect_to Table.find_by(id: @authentication.table_id), :flash => { :danger => '买单失败！' } }
        	format.json { render json: @authentication.errors, status: :unprocessable_entity }
      	end
    	else
    		format.html { redirect_to @table, :flash => { :danger => '无效的认证码！' } }
				format.json { render json: @authentication.errors, status: :unprocessable_entity }
    	end
    end
  	
  end
  
  # GET /edit_table/1
  def edit_table
  	admin_or_huanzhuo_user
  	@table = Table.find_by(id: @authentication.table_id)
  	@tables = Table.where(statu: true).limit(60)
  end
  
  # PATCH/PUT /update_table/1
  def update_table
  	admin_or_huanzhuo_user
  	@table_old = Table.find_by(id: @authentication.table_id)
  	@table_new = Table.find_by(id: params[:authentication][:table_id])
  	respond_to do |format|
			if @table_old.id == 1 # ba tai
				if @authentication.statu && @authentication.id != 1
					if @authentication.update(authentication_params) && @table_new.update(statu: false, authentication_id: @authentication.id)
						
						format.html { redirect_to @table_new, :flash => {:success => '初始换桌成功！'+@table_old.name+'-->>'+@table_new.name}  }
						format.json { head :no_content }
					else
						format.html { redirect_to @table_old, :flash => { :danger => '换桌失败！' }}
						format.json { render json: @authentication.errors, status: :unprocessable_entity }
					end	
				else
					format.html { redirect_to @table_old, :flash => { :danger => '无效的认证码！' } }
					format.json { render json: @authentication.errors, status: :unprocessable_entity }
				end
			else
				if @authentication.statu
					if @authentication.update(authentication_params) && @table_new.update(statu: false, authentication_id: @authentication.id) && @table_old.update(statu: true, authentication_id: 1)
						
						format.html { redirect_to @table_new, :flash => {:success => '换桌成功！'+@table_old.name+'-->>'+@table_new.name }}
						format.json { head :no_content }
					else
						format.html { redirect_to @table_old, :flash => { :danger => '换桌失败！' } }
						format.json { render json: @authentication.errors, status: :unprocessable_entity }
					end	
				else
					format.html { redirect_to @table_old, :flash => { :danger => '无效的认证码！' }}
					format.json { render json: @authentication.errors, status: :unprocessable_entity }
				end
			end
      
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication.destroy
    respond_to do |format|
      format.html { redirect_to authentications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentication).permit(:authentication_str, :table_id, :statu)
    end
end
