class ApplicationController < ActionController::Base
	def not_found
		rescue_from ActiveRecord::RecordNotFound, with: :not_found
	end
end
