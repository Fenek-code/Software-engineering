class MarksController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @mark = Mark.new
  end

  def create
    @products = Product.all
    @marks = Mark.all
    @product = Product.find(params[:product_id])
    @mark = @product.marks.create(params.require(:mark).permit(:points))
    if @mark.save
      render template: "products/index" , flash: {success: "Mark was added"}
    else
      render :new, flash: {alert: "Some bullshit has happened"}
    end
  end
end
