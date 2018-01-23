class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	# If the user exists && the password entered is correct 

  	if user && user.authenticate(params[:password])
  		# save the user inside the browser cookie.
  		# This is how the user will remain logged in while
  		# they navigate around the website
  		session[:user_id] = user.id
  		redirect_to '/'
  	else
  		# If the users login does not work then they will be sent back
  		# to the login form.
  		redirect_to '/login'
  		
  	end
  end

  def destroy
  	session[:user_id] = nil
  	# This might return error, double check when running server
  	redirect_to '/login'
  end
end
