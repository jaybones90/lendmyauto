require 'rails_helper'

describe User do
  let(:user){ FactoryBot.create(:user) }
  it { should validate_presence_of :email }
  it { should have_one :account }

  it "creates an account for a new user" do
    expect(user.account.user_id).to eq(user.id)
  end
end
