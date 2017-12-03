class Reservation < ApplicationRecord

  has_one :reservation_invoice, inverse_of: :reservation, dependent: :nullify

  belongs_to :renter_account, inverse_of: :reservations, optional: true, class_name: "Account", :foreign_key => "renter_account_id"

  belongs_to :lender_account, inverse_of: :loans, optional: true, class_name: "Account", :foreign_key => "lender_account_id"

  belongs_to :vehicle, inverse_of: :reservations, optional: true

  belongs_to :location, inverse_of: :reservations, optional: true



end
