class MoviesController < ApplicationController
  def index
    @movies = Movie.all_with_showtimes
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def new
    @movie = Movie.new
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

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update_attributes(movie_params)

    if @movie.save
      redirect_to root_path
    else
      @errors = @movie.errors.full_messages
      render :edit
    end
  end

  def destroy
    Movie.find_by(id: params[:id])
         .destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
