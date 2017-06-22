json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :Email_id, :login
  json.url user_url(user, format: :json)
end
