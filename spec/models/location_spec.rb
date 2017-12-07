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
end
