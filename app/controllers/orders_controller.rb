class OrdersController < ApplicationController
  before_action :category_all, only: %i(index new checkout)

  def index
    @oders = Order.paginate page: params[:page], per_page: Settings.per_page
  end

  def new; end

  def show; end

  def checkout
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    @order.user_id = current_user.id
    if @order.save
      session[:cart].each do |c|
        @item = @order.order_items.create!(product_id: c["product_id"],
          quantity: c["quantity"], price: c["price"])
        @item.product.update_quantity @item.quantity
      end
      set_cart
    else
      render :checkout
    end
  end

private
  def order_params
    params.require(:order).permit :receiver_name, :receiver_address,
      :receiver_phone, :total_price, :address
  end

  def set_cart
    session[:cart] = []
    flash[:success] = t ".checkout_sucsess"
    redirect_to orders_path
  end
end
