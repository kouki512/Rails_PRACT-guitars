class PracticesController < ApplicationController
  def index
    @practices = current_user.practices
    
  end

  def new
    @practice = Practice.new
  end

  def create  
    @practice = Practice.new(practices_params)
    @practice.user_id = current_user.id
    @practice.youtube_url = make_youtube_links #メソッド使用
    if @practice.save
      redirect_to practice_path(@practice.id)
    else
      render :new
    end
  end

  def show
    @practice = Practice.find(params[:id])
    @user = @practice.user
    unless @practice.user_id == current_user.id
      redirect_to practices_path
    end
    #@ratio = check_is_movie(@practice) #メソッド使用
  end

  def edit
    @practice = Practice.find(params[:id])
    @user = @practice.user
    unless @practice.user_id == current_user.id
      redirect_to practices_path
    end
  end

  def update
    @practice = Practice.find(params[:id])
     # youtubeの埋め込みリンク作成
    @practice.youtube_url = make_youtube_links
    if @practice.update(practices_params)
      redirect_to practice_path(@practice.id)
    else
      render :edit
    end
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    redirect_to practices_path
  end


  def make_youtube_links
    # youtubeの埋め込みリンク作成
    youtube_initial_url = params[:practice][:reference_url]
    if youtube_initial_url.include?("youtu")
      url = params[:practice][:reference_url]
      url = url.last(11)
      return url
    else 
      return nil
    end
  end

  # def check_is_movie(practice)
  #  # youtubeリンクの有無でGridシステムを変更
  #   if practice.textbook == "youtube" && practice.youtube_url.present?
  #     return 3 # gridシステム col-md-5
  #   else
  #     return 12 # gridシステム col-md-12
  #   end
  # end

  private

  def practices_params
    params.require(:practice).permit(:title,:reference_url,:details,:other_text,:body,:is_public,:is_finish,:textbook,practice_images_tab_images: [])
  end


end
