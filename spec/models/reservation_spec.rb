require 'rails_helper'

describe Reservation do

  let(:location) { FactoryBot.create(:location) }
  let(:vehicle){ FactoryBot.create(:vehicle, :current_location_id => location.id) }
  let(:reservation){ FactoryBot.create(:reservation, :vehicle_id => vehicle.id) }

  it { should have_one :reservation_invoice }
  it { should belong_to :renter_account }
  it { should belong_to :lender_account }
  it { should belong_to :vehicle }
  it { should belong_to :location }

  it "updates the status to in progress if status" do
    reservation.vehicle_id = vehicle.id
    expect(reservation.status).to eq("In Progress")
  end

  it "calculates the total price for a reservation" do
    expect(reservation.total_price).not_to be_nil
  end




end
