class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def confirm
    @user = User.new

    # need to create a user object to pass data into the params f the form_for
    #  form we created with hidden_fields
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

  # #10
  end

  def create
# #9
  @user = User.new
  @user.name = params[:user][:name]
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]
  @user.password_confirmation = params[:user][:password_confirmation]

# #10
  if @user.save
    flash[:notice] = "Welcome to Bloccit #{@user.name}!"
    redirect_to root_path
  else
    flash.now[:alert] = "There was an error creating your account. Please try again."
    render :new
  end
end


end
