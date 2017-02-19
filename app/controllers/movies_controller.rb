class MoviesController < ApplicationController
  def index
    @movies = Movie.all_with_showtimes
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def new; end

  def destroy
    Movie.find_by(id: params[:id])
         .destroy
    redirect_to root_path
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to new_movie_showtime_path @movie
    else
      @errors = @movie.errors.full_messages
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
