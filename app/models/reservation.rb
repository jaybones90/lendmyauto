class Reservation < ApplicationRecord
  before_save :update_total
  before_create :update_status

  attribute :date_range, :string

  has_one :reservation_invoice, inverse_of: :reservation, dependent: :nullify
  belongs_to :renter_account, inverse_of: :reservations, optional: true, class_name: "Account", :foreign_key => "renter_account_id"
  belongs_to :lender_account, inverse_of: :loans, optional: true, class_name: "Account", :foreign_key => "lender_account_id"
  belongs_to :vehicle, inverse_of: :reservations, optional: true
  belongs_to :location, inverse_of: :reservations, optional: true

  validates_associated :reservation_invoice

  def calculate_total
    duration = (end_date.to_date - start_date.to_date).to_i
    self.vehicle.daily_price * duration
  end

  private

  scope :exclude_existing_reservations, -> (date_start, date_end) {
    where.not( start_date: date_start..date_end, end_date: date_start..date_end ) if (start_date.present? &&
                                                                                      end_date.present?)
  }

  def update_status
    self.status = "In Progress" if self.status.nil?
  end

  def update_total
    self.total_price = calculate_total
  end

end
