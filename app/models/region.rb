class Region < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :region_libraries, dependent: :destroy
  has_many :libraries, through: :region_libraries
  belongs_to :company
  validates :region, presence: true
end
