class PostMoviesController < ApplicationController
    def index
        @post_movies = PostMovie.all
    end
    def new
        @post_movie = PostMovie.new
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
    end

    def edit

    end

    def update

    end

    def destroy

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
        params.require(:post_movie).permit(:title,:youtube_url,:body,:password)
      end
end