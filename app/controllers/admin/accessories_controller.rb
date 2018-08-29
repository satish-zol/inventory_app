class Admin::AccessoriesController < Admin::AdminController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]

  # GET /admin/accessories
  def index
    @accessories = Accessory.all.page(params[:page]).per(10)
  end

  # GET /admin/accessories/1
  def show
  end

  # GET /admin/accessories/new
  def new
    @accessory = Accessory.new
  end

  # GET /admin/accessories/1/edit
  def edit
  end

  # POST /admin/accessories
  def create
    @accessory = Accessory.new(accessory_params)

    if @accessory.save
      redirect_to admin_accessories_url, notice: 'Accessory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/accessories/1
  def update
    if @accessory.update(accessory_params)
      redirect_to admin_accessories_url, notice: 'Accessory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/accessories/1
  def destroy
    @accessory.destroy
    redirect_to admin_accessories_url, notice: 'Accessory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accessory_params
      params.require(:accessory).permit(:name, :accessory_type, :price)
    end
end
