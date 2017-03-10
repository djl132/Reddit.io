

# everything here, all modules ie, are global to all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
end
