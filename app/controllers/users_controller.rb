class UsersController < ApplicationController

  def new
    @user = User.new
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
    # assign session the signed in user's id - this will change the view
    create_session(@user)
    redirect_to root_path
  else
    flash.now[:alert] = "There was an error creating your account. Please try again."
    render :new
  end
end


def show
  @user = User.find(params[:id])
  @posts = @user.posts.visible_to(current_user)
  @favorite_posts = current_user.favorite_posts
end


end
