class UsersController < ApplicationController
	before_action :authenticate_user!

	def edit
		@bot = current_user.bot
	end

end