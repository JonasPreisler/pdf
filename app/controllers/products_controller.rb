class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # before_filter do |controller|
  #   controller.ensure_create_shop "Please create Shop first"
  # end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order(:created_at).page(params[:page])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.all.order(:created_at).page(params[:page])
    @seller = @product.seller
    @sellers = Seller.all
    @material = Material.all
  end

  # GET /products/new
  def new
     @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @material = @product.material
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

    def delete_values_data
       @product.values.destroy_all
    end

    def parse_product_attachment_params
      if params[:product].present? && params[:product][:product_attachment_ids].first.present?
        @product.product_attachments << ProductAttachment.where(id: params[:product][:product_attachment_ids].first.split(","))
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id]) or not_found if @product.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :material_id, :seller_id, :price, :seller, :product_image, :product_image_cache, :image, :product, :slug, :pdf, :purity, :stock, :diameter, :length, :surface_area, :gram, :price, :description, :solvent, :layer, :length_two, :mililiter, :product_type, :shop_id,  :materials, :materials=>[], :tag_ids => [], :tags_attributes => [:id, :name], :application_ids => [], :applications_attributes => [:id, :name], :market_ids => [], :markets_attributes => [:id, :name], :material_ids => [], :materials_attributes => [:id, :name], :product_attachment_ids =>[], product_attachment_attributes: [:id, :cover,:_destroy], values_attributes: [:id, :value, :category_id, :_destroy, :check_box_type])
    end

end
