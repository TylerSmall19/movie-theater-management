class ShowtimesController < ApplicationController
  def index
    @showtimes = Movie.find_by(id: params[:movie_id]).showtimes
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
