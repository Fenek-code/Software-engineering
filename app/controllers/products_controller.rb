class ProductsController < ApplicationController

  #Read
  def index
    @products = Product.all
    @marks = Mark.all
  end

  #Create
  def new
    @product = Product.new
  end

  def create
    product = Product.new(params.require(:product).permit(:title, :description))
    if product.save
      redirect_to action: :index, flash: {success: "HEY! Product was added!!!"}
    else
      render :new, flash: {alert: "Some error occured"}
    end
  end

  #Destroy
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to action: :index
  end

end
