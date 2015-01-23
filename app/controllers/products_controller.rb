class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]



  def index
  # this is publicly available 
    @products = Product.all
  end

  def show
  # this is publicly available 
  end

  def new
    # only logged in users
    if current_user.present?
      @product = Product.new
    else
      redirect_to new_session_path
      flash[:error] = "You need to be logged in to do that."
    end
  end

  def create
    # only logged in users
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "'#{@product.name}' was created in the shop"
      redirect_to product_path(@product)
    else
      flash[:error] = "Oops, something went wrong, try again"
      render :new
    end

  end

  def edit
    # only logged in users and User is product owner
  end

  def update
     # only logged in users and User is product owner
    if @product.update(product_params)
      flash[:success] = "'#{@product.name}' was updated"
      redirect_to product_path(@product)
    else
      flash[:error] = "Oops, something went wrong, try again"
      render :edit
    end

  end

  def destroy
     # only logged in users and User is product owner
    @product.destroy
    flash[:success] = "'#{@product.name}' was deleted from the shop"
    @product = nil
    redirect_to root_path
  end

  private
  def product_params
  	#Whitelisted form data
    params.require(:product).permit(:name, :description, :price_in_pence, :image)
  end

  def find_product
  	#Query to Read a record from the DB.
    @product = Product.find(params["id"])
  end


end
