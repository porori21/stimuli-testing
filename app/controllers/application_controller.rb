class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize
	protected
	def authorize
		unless User.find_by(id: session[:user_id])
			redirect_to login_url, notice: "Access Denied without login"
		end
	end

	private
	#Handling authentication
	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    	rescue ActiveRecord::RecordNotFound
  	end
  	helper_method :current_user

  	def logged_in?
    	current_user
  	end
  	helper_method :logged_in?

  	def check_login
    	redirect_to login_url, alert: "You need to log in to view this page" if current_user.nil?
  	end
end
