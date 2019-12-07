class Car < ApplicationRecord
  has_and_belongs_to_many :parts
  validates :Vin, uniqueness: true, length: {minimum: 11, maximum: 20}
  validates :model, presence: true, uniqueness: true, length: {minimum: 5, maximum: 15}
  validates :make, presence: true, uniqueness: true

end
