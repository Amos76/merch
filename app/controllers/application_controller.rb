class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?

	# look for user using session data
	def current_user
		# if there is session data use it to look up user
		if session[:user_id].present?
			User.find(session[:user_id])
		end

	end

	def current_user?
		current_user.present?
	end

	def require_user
		unless current_user?
			flash[:error] = "you must be logged in to do that"
			redirect_to new_session_path and return
		end
	end

# define an action that check for users
# and makes sure the user owns something

	def require_owner
		# check for current_user?
		# use current_user? to look for belongings
	end


end
