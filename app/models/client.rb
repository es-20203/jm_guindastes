class Client < ApplicationRecord
  belongs_to :address
  has_one :phone, dependent: :destroy
  has_one :service, dependent: :destroy

  accepts_nested_attributes_for :phone, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true

  validates_uniqueness_of :email, :cpf_cnpj
  validates :cpf_cnpj, :name, :email, presence:true
  validates_length_of :name, minimum: 10
  validates_length_of :cpf_cnpj, minimum: 11, maximum: 14
  validates_numericality_of :cpf_cnpj 
  validates_associated :address

end
