class Material < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :taggings, dependent: :destroy
    has_many :sellers, through: :taggings, dependent: :destroy
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
end
