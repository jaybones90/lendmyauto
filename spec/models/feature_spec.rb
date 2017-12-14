require 'rails_helper'

describe Feature do
  it { should have_and_belong_to_many :vehicles }
  it { should validate_presence_of :description }
  it { should validate_uniqueness_of :description }
end
