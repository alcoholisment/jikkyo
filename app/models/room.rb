class Room < ApplicationRecord
  has_many :messages
  validates :name, presence: true, length: { maximum: 40 }
end