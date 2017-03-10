# a module providing session methods to controllers, like user controllers,
# and session
 # controllers that regulate login/logout actions that start a session
module SessionsHelper


  # starts the session
  def create_session(user)
    session[:user_id] = user.id
  end

    # ACCESS CURRENT USER OBJECT - SIGN UP NAV LINK VIEW DEPENDS ON IT ALSO
  def current_user
    User.find_by(id: session[:user_id])
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

end
