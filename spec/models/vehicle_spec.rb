require 'rails_helper'

describe Vehicle do

  it { should validate_presence_of :make }
  it { should validate_presence_of :model }
  it { should validate_presence_of :year }
  it { should validate_presence_of :milage }
  it { should validate_presence_of :color }
  it { should validate_presence_of :seats }
  it { should validate_presence_of :doors }
  it { should validate_presence_of :transmission }
  it { should validate_presence_of :daily_price }
  it { should validate_presence_of :availability_start }
  it { should validate_presence_of :availability_end }

  it { should belong_to :current_location }
  it { should belong_to :category }
  it { should belong_to :owner_account }

  it { should have_and_belong_to_many :features }
  it { should have_many :images }
  it { should have_many(:reservations) }
  it { should have_many :reviews }

  it { should accept_nested_attributes_for :images }
  it { should accept_nested_attributes_for :category }

  context "vehicle search" do
    let!(:location1){FactoryBot.create(:location)}
    let!(:location2){FactoryBot.create(:location, city: "San Diego")}
    let!(:location3){FactoryBot.create(:location, city: "New York City")}
    let!(:vehicle1){FactoryBot.create(:vehicle, current_location_id: location1.id)}
    let!(:vehicle2){FactoryBot.create(:vehicle, current_location_id: location2.id)}
    let!(:vehicle3){FactoryBot.create(:vehicle, current_location_id: location3.id)}

    describe ".in_city" do
      it "returns vehicles that match a specific city" do
        found_vehicles = Vehicle.in_city("San Diego")
        expect(found_vehicles.first.current_location_id).to eq(location2.id)
        expect(found_vehicles.count).to eq(1)
      end
    end
  end



end
