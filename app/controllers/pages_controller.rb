class PagesController < ApplicationController

  def about
    @bot_users = BotUser.all.page(params[:page])
  end

end