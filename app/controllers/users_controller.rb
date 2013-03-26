class UsersController < ApplicationController

http_basic_authenticate_with :name => "root", :password => "secret", :except => [:new, :show, :edit, :create]

	def new

	end

  	def index
  		@user = User.all
  		if session[:user_id] != nil
  			@current_user = User.find(session[:user_id])
  			if @current_user[:role] != "Admin"
  				redirect_to :action => :show, :id => @current_user[:id]
  			end
  		else
  			redirect_to :controller => :welcome
  		end

  	end

  	def create
		@user = User.new(params[:user])
		if @user[:id] == 1
			@user[:role] = "Admin"
		else
		    @user[:role] = "User"
		end
		if @user.save
		render "_good"
		else
		render "_error_messages"
		end
  	end


	def show
		if session[:user_id] != nil
			@user = User.find(session[:user_id])
		else 
			redirect_to :controller => :welcome 
		end
	end

	def edit
		@user = User.find(params[:id])
		@current_user = User.find(session[:user_id])
		if @current_user[:role] != "Admin"
			redirect_to :action => :show
		else
		end
	end

	def update
		 @user = User.find(params[:id])
		 @current_user = User.find(session[:user_id])
 
  			if @user.update_attributes(params[:user])
    			if @current_user[:role] == "Admin"
    				redirect_to :controller => :users
    			else
    				redirect_to :action => :show
    			end
  			else
    			redirect_to :action => :show
  			end
	end

	def destroy

		@user = User.all
		i = 0
		@user.each do |user|
			if user[:role] == "Admin"
				i = i+1
			end
		end

		@user = User.find(params[:id])
		if @user[:role] == "User"  
	  	@user.destroy
	  	elsif @user[:role] == "Admin" && i>1
	  	@user.destroy 
    	end
    	
    	redirect_to :action => :index
	end

end
