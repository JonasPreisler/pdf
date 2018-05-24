class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # before_filter do |controller|
  #   controller.ensure_create_shop "Please create Shop first"
  # end

  # GET /products
  # GET /products.json
  def index
    if params[:format] == "json"
      products = Product.all.joins(:tags).where("tags.name like ?", "%#{params[:term]}%").limit(10).order("products.name").distinct.pluck("products.name")
      render json: products.sort_by(&:downcase).as_json
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
     @product = Product.new   
  end

  # GET /products/1/edit
  def edit
    @materials = @product.materials
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
    delete_values_data
    respond_to do |format|
      if @product.update(product_params)
        @product.update(seller_id: shop.id)
        parse_product_attachment_params
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
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :material_id, :seller_id, :seller, :image, :product, :slug, :purity, :stock, :diameter, :length, :surface_area, :gram, :price, :description, :product_type, :shop_id,  :materials, :materials=>[], :tag_ids => [], :tags_attributes => [:id, :name], :application_ids => [], :applications_attributes => [:id, :name], :market_ids => [], :markets_attributes => [:id, :name], :material_ids => [], :materials_attributes => [:id, :name], :product_attachment_ids =>[], product_attachment_attributes: [:id, :cover,:_destroy], values_attributes: [:id, :value, :category_id, :_destroy, :check_box_type])
    end

    def check_product_owner
      if current_user.shop.present?
        if !current_user.shop.products.include? @product
          flash[:notice] = "You Are not authorize user to edit this Product"
          redirect_to products_path
        else
          false
        end
      else
        false
      end
    end

end
