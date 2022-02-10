class UsersController < ApplicationController
  def show 
    @user = current_user
    @practices = @user.practices
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:my_guitar,:youtube_channel_url,:profile_image,:email,:password)
  end

end
