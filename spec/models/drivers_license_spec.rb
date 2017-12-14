require 'rails_helper'

describe DriversLicense do
  it { should belong_to :account }
  it { should have_one :image }
  it { should accept_nested_attributes_for :image}
  it { should validate_presence_of :number }
  it { should validate_presence_of :expiration_date }
  it { should validate_presence_of :issue_date }
  it { should validate_length_of(:number).is_at_most(15) }
  it { should validate_uniqueness_of :number }
end
