class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find_by(id: params[:showtime_id])
    @order = Order.new
  end

  def create
    @showtime = Showtime.find_by(id: params[:showtime_id])
    # Freezes values of tickets_left to resolve a bug
    @tickets = @showtime.tickets_left
    @order = @showtime.orders.build(order_params)

    if @order.save
      OrderMailer.confirmation(@order).deliver_later
      redirect_to [@showtime, @order]
    else
      render :new
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    if filtered?
      @orders = Order.filter_by_id(params[:movie])
                     .page(params[:page])
    else
      @orders = Order.order(:created_at)
                     .page(params[:page])
    end
    @movies = Movie.all
    @total = Order.total_of_orders
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

  def filtered?
    params.include?(:movie) && params[:movie] != ''
  end
end
