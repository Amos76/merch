class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]



  def index
    @products = Product.all
  end

  def show
  
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
  	#Whitelisted form data
  end

  def find_product
  	#Query to Read a record from the DB.
    @product = Product.find(params["id"])
  end


end
