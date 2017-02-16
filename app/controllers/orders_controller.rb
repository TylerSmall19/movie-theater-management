class OrdersController < ApplicationController
  def new
    @showtime=Showtime.find_by(id: params[:showtime_id])
  end
end
