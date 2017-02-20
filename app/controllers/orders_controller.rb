class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find_by(id: params[:showtime_id])
    @order = Order.new
  end

  def create
    @showtime = Showtime.find_by(id: params[:showtime_id])
    @tickets = @showtime.tickets_left

    @order = @showtime.orders.build(order_params)

    if @order.save
      OrderMailer.confirmation(@order).deliver_later
      redirect_to [@showtime, @order]
    else
      @errors = @order.errors.full_messages
      render :new
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = Order.all.order(:created_at)
  end

  private

  def order_params
    params.require(:order).permit(
                            :email,
                            :name,
                            :credit_card,
                            :showtime,
                            :expiration
                          )
  end
end
