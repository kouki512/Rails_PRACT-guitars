class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    @practices = @user.practices
  end
end
