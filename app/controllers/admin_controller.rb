class AdminController < ApplicationController
	def index
		 	if session[:user_id] != nil
  			@current_user = User.find(session[:user_id])
  			if @current_user[:role] != "Admin"
  				redirect_to :controller => :welcome
  			end
  		else
  			redirect_to :controller => :welcome
  		end
	end
end
