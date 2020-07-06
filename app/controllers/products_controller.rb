class ProductsController < ApplicationController
  
  def index
    @products = Product.all.order(price: :desc)
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @departments = Department.all
    render :new
  end

  def update
    id = params[:id]
    @product = Product.find(id)
    data = params.require(:product).permit(:name, 
                                            :author, 
                                            :description, 
                                            :price, 
                                            :amount, 
                                            :department_id
                                          )
    if @product.update data
      flash[:notice] = "This product was succesfully updated!"
      redirect_to root_url
    else
      @departments = Department.all
      render :new
    end
  end
  
  def create
    data = params.require(:product).permit(:name, 
                                            :author, 
                                            :description, 
                                            :price, 
                                            :amount, 
                                            :department_id
                                          )
    @product = Product.create data
    if @product.save
      flash[:notice] = "This product was succesfully saved!"
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @product = Product.new
    @departments = Department.all
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
