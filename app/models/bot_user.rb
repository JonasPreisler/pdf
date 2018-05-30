class BotUser < ApplicationRecord
	alias_attribute :test_test, :'test test'
	alias_attribute :last_name, :'last name'
	alias_attribute :messenger_user_id, :'messenger user id'
	alias_attribute :chatfuel_user_id, :'chatfuel user id'
	alias_attribute :first_name, :'first name'
	alias_attribute :last_user_freeform_input, :'last user freeform input'
	alias_attribute :pofile_pic_url, :'profile pic url'
  paginates_per 20
  belongs_to :user, optional: true
  belongs_to :bot, optional: true
  belongs_to :page, optional: true
end