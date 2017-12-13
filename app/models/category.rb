class Category < ApplicationRecord

  has_many :vehicles, inverse_of: :category

  validates :name, presence: true, uniqueness: true


end
