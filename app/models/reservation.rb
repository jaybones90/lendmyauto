class Reservation < ApplicationRecord
  before_create :update_status

  has_one :reservation_invoice, inverse_of: :reservation, dependent: :nullify
  validates_associated :reservation_invoice

  belongs_to :renter_account, inverse_of: :reservations, optional: true, class_name: "Account", :foreign_key => "renter_account_id"

  belongs_to :lender_account, inverse_of: :loans, optional: true, class_name: "Account", :foreign_key => "lender_account_id"

  belongs_to :vehicle, inverse_of: :reservations, optional: true

  belongs_to :location, inverse_of: :reservations, optional: true

  def update_status
    self.status = "In Progress" if self.status.nil?
  end

  private

  scope :with_availability, -> (start_date, end_date) {
    where.not( start_date: start_date..end_date, end_date: start_date..end_date )
  }

end
