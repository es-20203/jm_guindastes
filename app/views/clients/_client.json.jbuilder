json.extract! client, :id, :cpf_cnpj, :name, :email, :address_id, :created_at, :updated_at
json.url client_url(client, format: :json)
