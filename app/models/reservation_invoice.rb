class ReservationInvoice < ApplicationRecord

  belongs_to :reservation, inverse_of: :reservation_invoice

end
