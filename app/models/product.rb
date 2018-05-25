class Product < ApplicationRecord
    extend FriendlyId
    mount_uploader :product_image, ProductImageUploader
    friendly_id :name, use: [:slugged, :finders]
	def should_generate_new_friendly_id?
	  name_changed?
	end
    belongs_to :seller, optional: true
    belongs_to :material, optional: true


    def materials_objects
      Material.where(id: self.materials.reject(&:empty?)).map(&:name).join(",")
    end
    def sellers_objects
      Seller.where(id: self.sellers.reject(&:empty?)).map(&:name).join(",")
    end

end
