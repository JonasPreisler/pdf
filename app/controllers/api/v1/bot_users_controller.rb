module Api
  module V1
    class BotUsersController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

      def index
        bot_users = Bot_user.bot_user('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded bot_user', data:bot_users},status: :ok
      end

      def show
        bot_user = Bot_user.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded bot_user', data:bot_user},status: :ok
      end

      def create
        bot_user = Bot_user.new(bot_user_params)
        if bot_user.save
          render json: {status: 'SUCCESS', message:'Saved bot_user', data:bot_user },status: :ok
        else
          render json: {status: 'ERROR', message:'bot_user not saved',
          data:bot_user.errors},status: :unprocessable_entity
        end
      end

      private

      def bot_user_params
        params.permit(:first_name, :messenger_user_id, :created_at_desc)
      end
    end
  end
end