class PracticesController < ApplicationController
  def index
    @practices = Practice.all
    
  end

  def new
    @practice = Practice.new
  end

  def create  
    @practice = Practice.new(practices_params)
    @practice.user_id = current_user.id
    @practice.save
    redirect_to practice_path(@practice.id)
  end

  def show
    @practice = Practice.find(params[:id])
    @user = @practice.user
  end

  def edit
    @practice = Practice.find(params[:id])
  end

  def update
    @practice = Practice.find(params[:id])
    @practice.update(practices_params)
    redirect_to practice_path(@practice.id)
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    redirect_to practices_path
  end

  private

  def practices_params
    params.require(:practice).permit(:title,:reference_url,:reference_title,:other_text,:body,:is_public,:is_finish,:textbook)
  end


end
