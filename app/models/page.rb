class Page < ApplicationRecord

  has_many :bot_users, dependent: :destroy

end