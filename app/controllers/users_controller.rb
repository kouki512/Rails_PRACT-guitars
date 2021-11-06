class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    @practice = @user.practices
  end
end
