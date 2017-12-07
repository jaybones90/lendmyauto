require 'rails_helper'

describe Location do
  it { should have_many :vehicles }
  it { should have_many :reservations }
  it { should validate_presence_of :street_address}
  it { should validate_presence_of :city}
  it { should validate_presence_of :state}
  it { should validate_presence_of :zip_code}
  it { should validate_presence_of :country}
end
