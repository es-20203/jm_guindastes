json.extract! adress, :id, :street, :neighborhood, :zipcode, :number, :city, :client_id, :driver_id, :created_at, :updated_at
json.url adress_url(adress, format: :json)
