class Seller < ApplicationRecord
    mount_uploader :logo, LogoUploader
    has_many :taggings, dependent: :destroy
    has_many :materials, through: :taggings, dependent: :destroy
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
end
