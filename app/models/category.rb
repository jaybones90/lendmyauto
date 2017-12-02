class Category < ApplicationRecord

  has_many :vehicles, inverse_of: :category

end
