class Adress < ApplicationRecord
  belongs_to :client
  belongs_to :driver
end
