class Admin::ProductsController < Admin::AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    @products = Product.search(params).page(params[:page]).per(10)
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_url, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    if @product.update(product_params)
      redirect_to admin_products_url, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    @product.destroy
    redirect_to admin_products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :product_type, :brand, :model, :strings, :price, :serial_number, :purchased_at, :sold_at)
    end
end
