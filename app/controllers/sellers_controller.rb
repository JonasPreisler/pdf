class SellersController < ApplicationController
  before_action :authenticate_user! , only: [:create, :edit, :update, :destroy]
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_action :check_seller_owner, only:[:edit, :update]

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all.order(:created_at).page(params[:page])
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    @products = @seller.products.order(:created_at).page(params[:page])
    @sellers = Seller.all
    @seller = Seller.friendly.find(params[:id])
    @random_seller = Seller.where.not(id: @seller).order("RANDOM()").first
    @random_seller2 = Seller.where.not(id: @seller).order("RANDOM()").second
  end

  # GET /sellers/new
  def new
    if current_user
      @seller = Seller.new
    else
      redirect_to sellers_path
    end
  end

  # GET /sellers/1/edit
  def edit
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller }
        format.json { render :show, status: :created, location: @seller }
      else
        format.html { render :new }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to @seller }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:name, :products, :description, :materials, :logo_cache, :country, :website, :email, :logo, :material_name, :user_id)
    end

    def check_seller_owner
      if current_user.seller != @seller
        flash[:notice] = "You are not an authorized user to edit this store"
        redirect_to sellers_path
      end
    end

end
