class BotUsersController < ApplicationController
  before_action :set_bot_user, only: [:show, :edit, :update, :destroy]

  # GET /bot_users
  # GET /bot_users.json
  def index
    @bot_users = BotUser.all
  end

  # GET /bot_users/1
  # GET /bot_users/1.json
  def show
  end

  # GET /bot_users/new
  def new
    @bot_user = BotUser.new
  end

  # GET /bot_users/1/edit
  def edit
  end

  # POST /bot_users
  # POST /bot_users.json
  def create
    @bot_user = BotUser.new(bot_user_params)

    respond_to do |format|
      if @bot_user.save
        format.html { redirect_to @bot_user, notice: 'Bot user was successfully created.' }
        format.json { render :show, status: :created, location: @bot_user }
      else
        format.html { render :new }
        format.json { render json: @bot_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bot_users/1
  # PATCH/PUT /bot_users/1.json
  def update
    respond_to do |format|
      if @bot_user.update(bot_user_params)
        format.html { redirect_to @bot_user, notice: 'Bot user was successfully updated.' }
        format.json { render :show, status: :ok, location: @bot_user }
      else
        format.html { render :edit }
        format.json { render json: @bot_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bot_users/1
  # DELETE /bot_users/1.json
  def destroy
    @bot_user.destroy
    respond_to do |format|
      format.html { redirect_to bot_users_url, notice: 'Bot user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot_user
      @bot_user = BotUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bot_user_params
      params.require(:bot_user).permit(:first_name)
    end
end
