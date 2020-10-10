class Phone < ApplicationRecord
  belongs_to :client

  validates :phone_number, presence:true
  validates_numericality_of :phone_number

end
