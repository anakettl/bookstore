class ProductsController < ApplicationController
  
  before_action :set_product, only: [:edit, :update, :destroy]  

  def index
    @products = Product.all.order(price: :desc)
  end

  def edit
    rendering :new
  end

  def update
    if @product.update products_params
      flash[:notice] = "This product was succesfully updated!"
      redirect_to root_path
    else
      rendering :edit
    end
  end
  
  def create
    @product = Product.create products_params
    if @product.save
      flash[:notice] = "This product was succesfully saved!"
      redirect_to root_path
    else
      rendering :new
    end
  end

  def new
    @product = Product.new
    @departments = Department.all
  end
  
  def destroy
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

  private

  def products_params
    params.require(:product).permit(:name, 
                                    :author, 
                                    :description, 
                                    :price, 
                                    :amount, 
                                    :department_id
                                  )
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def rendering(view)
    @departments = Department.all
    render view
  end

end
