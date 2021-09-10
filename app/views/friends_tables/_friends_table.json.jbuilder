json.extract! friends_table, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friends_table_url(friends_table, format: :json)
