class ProductsController < ApplicationController
  
  def index
    @products = Product.all.order(price: :desc)
  end

  def create
    product = params.require(:product).permit(:name, :author, :description, :price, :amount)
    Product.create product

    redirect_to root_path
  end
  
end
