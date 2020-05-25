class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  validates :genre, presence: true
end
