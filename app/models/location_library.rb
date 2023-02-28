class LocationLibrary < ApplicationRecord
  belongs_to :location
  belongs_to :library
end
