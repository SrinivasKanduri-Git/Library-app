class Location < ApplicationRecord
  has_many :location_libraries, dependent: :destroy
  has_many :libraries, through: :location_libraries
  belongs_to :region
  validates :location, presence: true
end
