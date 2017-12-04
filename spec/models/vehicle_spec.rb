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

  it { should belong_to :current_location }
  it { should belong_to :category }
  it { should belong_to :owner_account }

  it { should have_and_belong_to_many :features }
  it { should have_many :images }
  it { should have_many(:reservations) }
  it { should have_many :reviews }




end
