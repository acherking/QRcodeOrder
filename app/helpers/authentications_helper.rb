module AuthenticationsHelper

	def sign_in(authentication)
		cookies.permanent[:authentication_str] = authentication.authentication_str
		self.current_authentication = authentication
	end

	def current_authentication=(authentication)
		@current_authentication = authentication
	end

	def current_authentication
		authentication_str = cookies[:authentication_str]
		@current_authentication ||= Authentication.find_by(authentication_str: authentication_str)
	end

	def sign_out
		self.current_authentication = nil
		cookies.delete(:authentication_str)
	end

	def valid_authentication
		current_authentication
		if @current_authentication
			if !@current_authentication.statu	
				render 'static_pages/authentication_error'
			end
		else
			render 'static_pages/authentication_error'
		end
	end

end
