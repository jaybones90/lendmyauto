class Feature < ApplicationRecord
  has_and_belongs_to_many :vehicles

  validates :description, presence: true, uniqueness: true

end
