class ProductsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index, :show]
 before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Votre article a été enregistré"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end

end
