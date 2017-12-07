require 'rails_helper'

describe DriversLicense do
  it { should belong_to :account }
  it { should have_one :image }
  it { should accept_nested_attributes_for :image}

end
