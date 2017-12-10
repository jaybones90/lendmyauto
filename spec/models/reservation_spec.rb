require 'rails_helper'

describe Reservation do

  let(:reservation){ FactoryBot.create(:reservation) }

  it { should have_one :reservation_invoice }
  it { should belong_to :renter_account }
  it { should belong_to :lender_account }
  it { should belong_to :vehicle }
  it { should belong_to :location }

  it "updates the status to in progress if status" do
    reservation.update_status
    expect(reservation.status).to eq("In Progress")
  end




end
