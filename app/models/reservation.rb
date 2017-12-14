class Reservation < ApplicationRecord
  before_create :update_status

  has_one :reservation_invoice, inverse_of: :reservation, dependent: :nullify
  belongs_to :renter_account, inverse_of: :reservations, optional: true, class_name: "Account", :foreign_key => "renter_account_id"
  belongs_to :lender_account, inverse_of: :loans, optional: true, class_name: "Account", :foreign_key => "lender_account_id"
  belongs_to :vehicle, inverse_of: :reservations, optional: true
  belongs_to :location, inverse_of: :reservations, optional: true

  validates_associated :reservation_invoice

  def calculate_total
    duration = (end_date.to_date - start_date.to_date).to_i
    total = self.vehicle.daily_price * duration
    binding.pry
  end

  def update_status
    self.status = "In Progress" if self.status.nil?
  end

  private

  scope :exclude_existing_reservations, -> (date_start, date_end) {
    where.not( start_date: date_start..date_end, end_date: date_start..date_end )
  }



end
