class OrdersController < ApplicationController
  def new
    @showtime=Showtime.find_by(id: params[:showtime_id])
  end

  def create
    order = Order.new(order_params)
    redirect_to root if order.valid?
    redirect_back
  end

  private
  def order_params
    params.require(:order).permit(
                            :email,
                            :name,
                            :credit_card,
                            :expiration,
                            :showtime
                          )
  end
end
