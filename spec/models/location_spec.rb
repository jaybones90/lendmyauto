require 'rails_helper'

describe Location do

  let(:location){FactoryBot.create(:location)}

  it { should have_many :vehicles }
  it { should have_many :reservations }
  it { should validate_presence_of :street_address}
  it { should validate_presence_of :city}
  it { should validate_presence_of :state}
  it { should validate_presence_of :zip_code}
  it { should validate_presence_of :country}

  it "returns a country name from the country abbrevation" do
    expect(location.country_name).to eq("United States")
  end

  # describe ".in_city" do
  #   let(:location1){FactoryBot.create(:location)}
  #   let(:location2){FactoryBot.create(:location, city: "San Diego")}
  #   it "returns locations with matching city" do
  #     found_locations = Location.in_city("Portland")
  #     expect(found_locations.count).to eq(1)
  #     expect(found_locations.first.city).to eq("Portland")
  #   end
  # end

end
