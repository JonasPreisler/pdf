class Material < ApplicationRecord
    mount_uploader :image, ImageUploader
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
	def should_generate_new_friendly_id?
	  name_changed?
	end
    has_many :products
end
