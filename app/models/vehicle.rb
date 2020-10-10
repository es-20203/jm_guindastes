class Vehicle < ApplicationRecord
	has_one :service, dependent: :destroy

	validates_uniqueness_of :board
	validates :status, :board, :category, presence:true
	validates_length_of :board, maximum: 7
end
