class BotsController < ApplicationController
  before_action :set_bot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:create, :edit, :update, :destroy]
  before_action :check_bot_owner, only:[:edit, :update]

  # GET /bots
  # GET /bots.json
  def index
    @bots = Bot.all
  end

  # GET /bots/1
  # GET /bots/1.json
  def show
    @bot_users = @bot.bot_users.order(:created_at).page(params[:page])
  end

  # GET /bots/new
  def new
    @bot = Bot.new
  end

  # GET /bots/1/edit
  def edit
  end

  # POST /bots
  # POST /bots.json
  def create
    @bot = Bot.new(bot_params)

    respond_to do |format|
      if @bot.save
        format.html { redirect_to @bot, notice: 'Bot was successfully created.' }
        format.json { render :show, status: :created, location: @bot }
      else
        format.html { render :new }
        format.json { render json: @bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bots/1
  # PATCH/PUT /bots/1.json
  def update
    respond_to do |format|
      if @bot.update(bot_params)
        format.html { redirect_to @bot, notice: 'Bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @bot }
      else
        format.html { render :edit }
        format.json { render json: @bot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bot.destroy
    respond_to do |format|
      format.html { redirect_to bots_url, notice: 'Bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def connect
    messenger_user_id = params['messenger user id']
    first_name = params['first name']
    last_name = params['last name']
    chatfuel_user_id = params['chatfuel user id']
    last_user_freeform_input = params['last user freeform input']
    profile_pic_url = params['profile pic url']
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot
      @bot = Bot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bot_params
      params.require(:bot).permit(:name, :first_name, :user_id, :bot_user, :'first_name')
    end

    def check_bot_owner
      if current_user.bot != @bot
        flash[:notice] = "You are not an authorized user to edit this bot"
        redirect_to bots_path
      end
    end

end
