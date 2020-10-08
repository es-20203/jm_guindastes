json.extract! phone, :id, :phone_number, :driver_id, :client_id, :created_at, :updated_at
json.url phone_url(phone, format: :json)
