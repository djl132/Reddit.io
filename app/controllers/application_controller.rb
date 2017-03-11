

# everything here, all modules ie, are global to all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

 # require sign in to
   def require_sign_in
     unless current_user
       flash[:alert] = "You must be logged in to do that"
       redirect_to new_session_path
     end
   end

end
