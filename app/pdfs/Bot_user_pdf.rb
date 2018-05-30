class BotUserPdf < Prawn::Document
	def initialize(bot_user)
		super(top_margin:70)
		@bot_user = bot_user
		bot_user_id
		bot_users
	end

	def bot_user_id
		text "#{@bot_user.first_name}", size: 20, style: :bold
		text "#{BotUser.group_by_day(:created_at).count}"
		text "<%= line_chart BotUser.group_by_day(:created_at).count %>"
	end

	# def amount_of_users_rows
	# 	[["Number", "Agency"]] +
	# 	@pdf.amount_of_users.map do |pdf|
	# 		[amount_of_users]
	# 	end
	# end
end