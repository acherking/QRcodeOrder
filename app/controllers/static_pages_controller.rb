# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
	# GET /?authentication_str=88888888
  def home
		authentication_str = params[:authentication_str]
   	authentication = Authentication.find_by(authentication_str: authentication_str)
		if authentication
			if authentication.statu
				sign_in_auth(authentication)
			end
		end
		
		valid_authentication

		@food_types = FoodType.all
  end
end
