class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    @practices = @user.practices
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:my_guitar,:youtube_channel_url,:profile_image,:email,:password)
  end

end
