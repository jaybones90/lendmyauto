require 'rails_helper'

describe Review do
  it { should belong_to :vehicle }
  it { should belong_to :reviewer_account }
end
