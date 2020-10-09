class Service < ApplicationRecord
  belongs_to :address
  belongs_to :driver
  belongs_to :client
  belongs_to :vehicle
end
