class ProductsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index, :show]
 before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search_key]
      @products = Product.where("name LIKE ? OR description LIKE ?",
      "%#{params[:search_key]}%", "%#{params[:search_key]}%")
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
  @product = current_user.products.build(product_params)
    @product.user = current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Votre article a été crée') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
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
    params.require(:product).permit(:name, :description, :category, :price, :taille, :marque, :sexe, :etat, :couleur, :matiere, :photo, :search_key)
  end

end
