module Api
  module V1
    class BotUsersController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
      protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token

      def index
        bot_users = BotUser.bot_user('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded bot_user', data:bot_users},status: :ok
      end

      def show
        bot_user = BotUser.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded bot_user', data:bot_user},status: :ok
      end

      def create
        bot_user = BotUser.new(bot_user_params)
        if bot_user.save
          render json: {status: 'SUCCESS', message:'Saved bot_user', data:bot_user },status: :ok
        else
          render json: {status: 'ERROR', message:'bot_user not saved',
          data:bot_user.errors},status: :unprocessable_entity
        end
      end

      def connect
        messenger_user_id = params['messenger user id']
        first_name = params['first name']
        last_name = params['last name']
        chatfuel_user_id = params['chatfuel user id']
        last_user_freeform_input = params['last user freeform input']
      end

      private

      def bot_user_params
        params.permit(:first_name, :messenger_user_id, :created_at_desc, :'test test', :'first name', :last_name, :'last name', :'messenger user id', :timezone, :gender, :locale, :chatfuel_user_id, :'chatfuel user id', :source, :last_user_freeform_input, :'last user freeform input')
      end
    end
  end
end