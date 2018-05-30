class Seller < ApplicationRecord
    mount_uploader :logo, LogoUploader
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
	def should_generate_new_friendly_id?
	  name_changed?
	end
  has_many :products, dependent: :destroy
  belongs_to :user
  paginates_per 12
end
