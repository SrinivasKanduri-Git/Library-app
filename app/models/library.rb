class Library < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :region_libraries, dependent: :destroy
  has_many :regions, through: :region_libraries
  has_many :location_libraries, dependent: :destroy
  has_many :locations, through: :location_libraries
  validates :lib_name, presence: true
  validates :regions, presence: true
  validates :locations, presence: true
end
