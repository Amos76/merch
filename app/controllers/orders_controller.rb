class OrdersController < ApplicationController
	before_action :require_user
  before_action :find_product, except: [:index, :show]

  def index
  	# list all previous orders for current_user
  end

  def show
  	# show order as receipt
    @product = Product.find(params["id"])
    @order = Order.find(params["id"])
  end

  def new
  	@order = current_user.orders.new
  end

  def create
    @order = @product.orders.new(order_params)
    @order.user = current_user
    
    if @order.save
      Stripe.api_key = "sk_test_xBJu8sqHUlOr0TUAivcBjOpJ"

      Stripe::Charge.create(
        :amount => @order.product.price_in_pence,
        :currency => "gbp",
        :card => @order.stripe_token, # obtained with Stripe.js
        :description => "Charge for #{@order.product.name} purchased by #{@order.user.email}"
      )

    	# create a charge via Stripe
    	# save purchase record
      flash[:success] = "thanks for your purchase of #{@product.name}"
    	# redirect to receipt (show action)
      redirect_to user_order_path(current_user, @product)
    else
      flash[:error] = "Oops, try again"
      render :new
  end
end


private
  def order_params
    params.require(:order).permit(:stripe_token, :delivery_address)
  end

  def find_product
      @product = Product.find(params["product_id"])
  end
end

