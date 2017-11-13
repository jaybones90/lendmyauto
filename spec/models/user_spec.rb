require 'rails_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :age }
  it { should validate_presence_of :phone_number }

  it { should have_many :addresses }
  it { should have_many :vehicles }
end
