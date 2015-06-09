module AuthenticationsHelper

	def sign_in_auth(authentication)
		cookies.permanent[:authentication_str] = authentication.authentication_str
		self.current_authentication = authentication
		self.current_table = Table.find_by(id: authentication.table_id)
	end

	def signed_in_auth?
    !current_authentication.nil?
  end

	def current_authentication=(authentication)
		@current_authentication = authentication
	end
	
	def current_table=(table)
		@current_table = table
	end

	def current_authentication
		authentication_str = cookies[:authentication_str]
		@current_authentication ||= Authentication.find_by(authentication_str: authentication_str)
		if @current_authentication
			@current_table ||= Table.find_by(id: @current_authentication.table_id)
		end
	end

	def sign_out
		self.current_authentication = nil
		cookies.delete(:authentication_str)
	end

	def valid_authentication
		current_authentication
		if @current_authentication && @current_table
			if !@current_authentication.statu	|| ((@current_authentication.table_id == 1) && (Table.first.authentication_id != @current_authentication.id))
				render 'static_pages/authentication_error'
			end
		else
			render 'static_pages/authentication_error'
		end
	end

end
