class SellerPdf < Prawn::Document
	def initialize(bot_user)
		super(top_margin:70)
		@seller = seller
		seller_products
		seller_name
	end

	def seller_name
		text "#{@seller.name}", size: 20, style: :bold
		text "#{Products.group_by_day(:created_at).count}"
	end

	def seller_products
		text "#{Products.group_by_day(:created_at).count}"
		text "<%= line_chart Product.group_by_day(:created_at).count %>"
	end

	# def amount_of_users_rows
	# 	[["Number", "Agency"]] +
	# 	@pdf.amount_of_users.map do |pdf|
	# 		[amount_of_users]
	# 	end
	# end
end