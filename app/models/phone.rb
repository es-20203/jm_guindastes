class Phone < ApplicationRecord
  belongs_to :driver
  belongs_to :client
end
