class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find_by(id: params[:showtime_id])
  end

  def create
    @showtime = Showtime.find_by(id: params[:showtime_id])
    order = @showtime.orders.build(order_params)
    order.date = params[:date]

    if order.save
      redirect_to [@showtime, order]
    else
      @errors = order.errors.full_messages
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(
                            :email,
                            :name,
                            :credit_card,
                            :date,
                            :showtime
                          )
  end
end
