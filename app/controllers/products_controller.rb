class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @products = @products.where("title LIKE :filter", {:filter => "%"+params[:filter]+"%"}).limit(params[:filter]) unless params[:filter].nil? or params[:filter] == ""
    #@products = @products.limit(params[:limit]) unless params[:limit].nil? or params[:limit] == ""
    @products = @products.where("price >= :from_price AND price <= :to_price", {:from_price => params[:from_price], :to_price => params[:to_price]}) if params[:from_price] and params[:to_price]
    @products = @products.limit(10)
    #@products = @products.limit(params[:limit]).offset(params[:from]) if params[:limit] and params[:from]


    if params[:q]     #toma un numero que se ingrese y devuelve la cantidad de categorias que se pidio
      @products = @products.limit(params[:q]) 
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def new
    @product = Product.new

    render 'show'
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    head :no_content
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price)
    end
end
