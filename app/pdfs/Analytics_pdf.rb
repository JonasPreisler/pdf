class AnalyticsPdf < Prawn::Document
	def initialize(pdf)
		super(top_margin:70)
		@pdf = pdf
		business_name
		amount_of_users
	end

	def business_name
		text "Chatbot analytics for:"
		text "#{@pdf.business_name}", size: 20, style: :bold
	end

	def amount_of_users
		text "Amount of users:"
		text "#{@pdf.amount_of_users}", size: 20, style: :bold
	end

	# def amount_of_users_rows
	# 	[["Number", "Agency"]] +
	# 	@pdf.amount_of_users.map do |pdf|
	# 		[amount_of_users]
	# 	end
	# end
end