class Address < ApplicationRecord
	has_one :client, dependent: :destroy 
	has_one :service, dependent: :destroy 
    
    validates :street, :neighborhood, :zipcode, :number, :city, presence:true
	validates_length_of :zipcode, maximum: 8, minimum: 8
	validates_numericality_of :number
	validates_numericality_of :zipcode 
	  
end
