json.extract! bot_user, :id, :first_name, :created_at, :updated_at
json.url bot_user_url(bot_user, format: :json)
