require 'rails_helper'

describe Reservation do

  let(:reservation){ FactoryBot.create(:reservation) }
  let(:location) { FactoryBot.create(:location) }
  let(:vehicle){ FactoryBot.create(:vehicle, :current_location_id => location.id) }

  it { should have_one :reservation_invoice }
  it { should belong_to :renter_account }
  it { should belong_to :lender_account }
  it { should belong_to :vehicle }
  it { should belong_to :location }

  it "updates the status to in progress if status" do
    reservation.update_status
    expect(reservation.status).to eq("In Progress")
  end

  # it "calculates the total price for a reservation" do
  #   reservation.vehicle_id = vehicle.id
  #   reservation.calculate_total
  #
  # end




end
