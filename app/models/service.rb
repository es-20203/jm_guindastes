class Service < ApplicationRecord
  belongs_to :address
  belongs_to :driver
  belongs_to :client
  belongs_to :vehicle
  
  validates :status, :price, :data, presence: true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.00} 
  
end
