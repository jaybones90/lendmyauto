class Review < ApplicationRecord

  belongs_to :vehicle, inverse_of: :reviews

  belongs_to :reviewer_account, inverse_of: :reviews

end
