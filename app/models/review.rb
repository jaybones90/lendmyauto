class Review < ApplicationRecord

  belongs_to :vehicle, inverse_of: :reviews

  belongs_to :reviewer_account, class_name: "Account", inverse_of: :reviews

end
