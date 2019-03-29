json.extract! user, :id, :name, :avater, :category_id, :created_at, :updated_at
json.url user_url(user, format: :json)
