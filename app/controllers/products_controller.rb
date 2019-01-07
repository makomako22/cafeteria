class ProductsController < ApplicationController

# before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    redirect_to products_path
  end

  def destroy
    product = Product.find(params[:id])
    #if tweet.user_id == current_user.id
      product.destroy
    #end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    #if tweet.user_id == current_user.id
    product.update(product_params)
    #end
  end

  private

  def product_params
      params.require(:product).permit(:name, :recommendation, :price, :avatar)
  end

end