class SessionsController < ApplicationController
# create action that obtains information
 # about the user to start the session
  def new
  end

# create a session using the signed in user, obtained by the sign in form.
  def create

    # get current user and create session with that user
    user = User.find_by(email: params[:session][:email])

    if user &&  user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password.'
      render :new
    end
  end

  def destroy
# user argument is to make sure that a session is not ended
 # without an existing user already there,but what's the harm of that?
    destroy_session(current_user)
    flash[:notice] = "You've been logged out, come back soon!"
    redirect_to root_path
  end

end
