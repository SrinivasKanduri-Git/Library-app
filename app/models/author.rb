class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :author, presence: true, length: {minimum: 5}
end
