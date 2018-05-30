class Bot < ApplicationRecord
  belongs_to :user
  has_many :bot_users, dependent: :destroy
end
