class Company < ApplicationRecord
  has_many :regions, dependent: :destroy
  validates :company_name, presence: true
  validates :established_on, presence: true
end
