class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /line_items
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  def create
    if params[:product_id]
      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product)
    end
    if params[:accessory_id]
      accessory = Accessory.find(params[:accessory_id])
      @line_item = @cart.add_product(accessory)
    end
    if @line_item.save
      redirect_to @line_item.cart, notice: 'Item added to cart.'
    else
      render :new
    end
  end

  # PATCH/PUT /line_items/1
  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /line_items/1
  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    redirect_to cart_path(@cart), notice: 'Line item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :accessory_id)
    end
end
