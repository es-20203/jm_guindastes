class Client < ApplicationRecord
	has_one :adress, dependent: :destroy
	has_one :phone, dependent: :destroy
end
