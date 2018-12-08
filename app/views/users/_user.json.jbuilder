json.extract! user, :id, :name, :telephone, :email, :login, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
