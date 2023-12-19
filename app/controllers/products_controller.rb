class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to category_path(@product.category_id)
      flash[:success] = 'Product Lounched successfully .'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to category_product_path(@product)
      flash[:success] = 'product Updated successfully .'
    else
      render :edit, status: :unprocessable_entity
      flash.now[:alert] = 'Something went wrong!'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :cover_image, :description, :quantity)
  end
end
