class ShowtimesController < ApplicationController
  def index
    @showtimes = Movie.find_by(id: params[:movie_id])
                      .showtimes.order(:time)
  end

  def new
    @showtime = Movie.find_by(id: params[:movie_id])
                     .showtimes.new
  end

  def edit
    @showtime = Showtime.find_by(id: params[:id])
  end

  def update
    @showtime = Showtime.find_by(id: params[:id])
    @showtime.update_attributes(showtime_params)
    if @showtime.save
      redirect_to movie_showtimes_path(@showtime.movie)
    else
      @errors = @showtime.errors.full_messages
      render :edit
    end
  end

  def create
    movie = Movie.find_by(id: params[:movie_id])
    @showtime = movie.showtimes.build(showtime_params)

    if @showtime.save
      redirect_to movie_showtimes_path(movie)
    else
      p @errors = @showtime.errors.full_messages
      render :new
    end
  end

  def destroy
    movie = Movie.find_by(id: params[:movie_id])
    show = Showtime.find_by(id: params[:id])

    show.destroy

    if movie.showtimes.any?
      redirect_to movie_showtimes_path(movie)
    else
      redirect_to root_path
    end
  end

  private

  def showtime_params
    params.require(:showtime).permit(:screen_id, :time, :price)
  end
end
