class TicketsController < ApplicationController
  def index
    @tickets = Movie.find_by(id: params[:movie_id]).tickets
  end
end
