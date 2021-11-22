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
    @practice.youtube_url = make_youtube_links #メソッド使用
    @practice.save
    redirect_to practice_path(@practice.id)
  end

  def show
    @practice = Practice.find(params[:id])
    @user = @practice.user
    @ratio = check_is_movie(@practice) #メソッド使用
 
  end

  def edit
    @practice = Practice.find(params[:id])
  end

  def update
    @practice = Practice.find(params[:id])
     # youtubeの埋め込みリンク作成
    @practice.youtube_url = make_youtube_links
    @practice.update(practices_params)
    redirect_to practice_path(@practice.id)
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    redirect_to practices_path
  end


  def make_youtube_links
    # youtubeの埋め込みリンク作成
    if params[:practice][:textbook] == "youtube" && params[:practice][:reference_url] != nil
      url = params[:practice][:reference_url]
      url = url.last(11)
      return url
    else 
      return nil
    end
  end

  def check_is_movie(practice)
   # youtubeリンクの有無でGridシステムを変更
    if practice.textbook == "youtube" && practice.youtube_url.present?
      return 5 # gridシステム col-md-5
    else
      return 12 # gridシステム col-md-12
    end
  end

  private

  def practices_params
    params.require(:practice).permit(:title,:reference_url,:details,:other_text,:body,:is_public,:is_finish,:textbook)
  end


end
