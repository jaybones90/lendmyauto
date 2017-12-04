require 'rails_helper'

describe Feature do
  it { should have_and_belong_to_many :vehicles }
end
