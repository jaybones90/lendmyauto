require 'rails_helper'

describe Vehicle do
  it { should validate_presence_of :make }
  it { should validate_presence_of :model }
  it { should validate_presence_of :year }
  it { should validate_presence_of :milage }
  it { should validate_presence_of :color }
  it { should validate_presence_of :seats }
  it { should validate_presence_of :transmission }
  it { should validate_presence_of :category }
  it { should validate_presence_of :all_wheel_drive }
  it { should validate_presence_of :pets_allowed }
  it { should validate_presence_of :smoking_allowed }
  it { should validate_presence_of :daily_price }
  it { should validate_presence_of :availability_start }
  it { should validate_presence_of :availability_end }

  it { should belong_to :user }

  it { should have_many :features }


end
