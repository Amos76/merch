class ProductsController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :find_product, except: [:index, :new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]


  def index
  # this is publicly available 
    @products = Product.all
  end

  def show
  # this is publicly available 
  end

  def new
    # only logged in users
    # require_user
    @product = current_user.products.new
    
  end

  def create
    # only logged in users
    # require_user
    @product = current_user.products.new(product_params)
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
    # require_owner(@product)
  end

  def update
     # only logged in users and User is product owner
    # require_owner(@product)
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
    # require_owner(@product)
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

# define an action that check for users
# and makes sure the user owns something

  def require_owner
    # check for current_user?
    if current_user?
    # use current_user? to look for belongings
    #  compare product parameter with current_user - does user own product
      unless @product.user == current_user
        flash[:error] = "you can only manage products you own"
        redirect_to root_path and return
      end
    else
      flash[:error] = "you must be logged in to do that"
      redirect_to new_session_path and return
    end
  end

end

