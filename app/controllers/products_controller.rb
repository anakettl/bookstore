class ProductsController < ApplicationController
  
  def index
    @products = Product.all.order(price: :desc)
  end

  def create
    product = params.require(:product).permit(:name, :author, :description, :price, :amount)
    Product.create product

    redirect_to root_path
  end

  def destroy
    id = params[:id]
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = 'Product was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  def search
    @name = params[:name]
    @products = Product.where "name like ?", "%#{@name}%"
  end
  
end
