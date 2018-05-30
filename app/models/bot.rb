class Bot < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :bot_users, dependent: :destroy
  paginates_per 9
end
