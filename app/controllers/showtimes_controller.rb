class ShowtimesController < ApplicationController
  def index
    @showtimes = Movie.find_by(id: params[:movie_id]).showtimes
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @showtime = @movie.showtimes.build(showtime_params)

    if @showtime.save
      redirect_to movie_showtime_path(@movie, @showtime)
    else
      p @errors = @showtime.errors.full_messages
      render :new
    end
  end

  private

  def showtime_params
    params.require(:showtime).permit(:screen_id, :time, :price)
  end
end
