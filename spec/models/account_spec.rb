require 'rails_helper'

describe Account do
  it { should validate_presence_of :user_first_name }
  it { should validate_presence_of :user_last_name }
  it { should validate_presence_of :user_birth_date }
  it { should validate_presence_of :user_phone_number }
  it { should belong_to :user }

  it "adds an account to newly created user" do
    user = FactoryBot.create(:user)
    user.account.id.should_not eq(nil)
  end
end
