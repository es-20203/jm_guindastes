class Vehicle < ApplicationRecord
	has_one :service, dependent: :destroy

	validates_uniqueness_of :board
	validates :status, :board, :category, presence:true
end
