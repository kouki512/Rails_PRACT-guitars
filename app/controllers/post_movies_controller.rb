class PostMoviesController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show,:certification]
    def index
        @post_movies = PostMovie.all
    end
    def new
        @post_movie = PostMovie.new
        unless user_signed_in?
          redirect_to post_movies_path
        end
    end

    def create
        @post_movie = PostMovie.new(post_movie_params)
        @post_movie.youtube_url = make_youtube_links #メソッド使用
        @post_movie.user_id = current_user.id
        @post_movie.save
        redirect_to post_movie_path(@post_movie.id)
    end

    def show
        @post_movie = PostMovie.find(params[:id])
        unless session[:password_checker] == true
          if @post_movie.password != nil
            render :check_password
          end
        end
        @user = @post_movie.user
        session[:password_checker] = false
    end

    def edit
      @post_movie = PostMovie.find(params[:id])
      unless @post_movie.user_id == current_user.id
        redirect_to post_movies_path
      end
    end

    def update
      @post_movie = PostMovie.find(params[:id])
      
      if @post_movie.update(
        title: post_movie_params[:title],
        body: post_movie_params[:body],
        password: post_movie_params[:password]
      )
      redirect_to post_movie_path(@post_movie.id)
      else
        render :edit
      end
    end

    def destroy
      @post_movie = PostMovie.find(params[:id])
      @post_movie.destroy
      redirect_to post_movies_path
    end

    def certification
      @post_movie = PostMovie.find(params[:id])
      if @post_movie.password == params[:post_movie][:input_password].to_i
        session[:password_checker] = true
        redirect_back(fallback_location: root_path)
      else 
        redirect_back(fallback_location: root_path)
      end
    end

    def make_youtube_links
        # youtubeの埋め込みリンク作成
        youtube_initial_url = params[:post_movie][:youtube_url]
        if youtube_initial_url.include?("youtu")
          url = params[:post_movie][:youtube_url]
          url = url.last(11)
          return url
        else 
          return nil
        end
    end

    

    private
    def post_movie_params
        params.require(:post_movie).permit(:title,:youtube_url,:body,:password,:input_password)
      end
end
