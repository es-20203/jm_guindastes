class Driver < ApplicationRecord
	has_one :service, dependent: :destroy

	validates_uniqueness_of :cnh
	validates :cpf, :name, :cnh, presence:true
	validates_length_of :name, minimum: 10
	validates_numericality_of :cpf, :cnh
	validates_length_of :cpf, :cnh, maximum: 11
    
end
