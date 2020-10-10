json.extract! address, :id, :street, :neighborhood, :zipcode, :number, :city, :created_at, :updated_at
json.url address_url(address, format: :json)
