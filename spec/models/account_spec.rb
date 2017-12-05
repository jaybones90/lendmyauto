require 'rails_helper'

describe Account do
  let(:user){FactoryBot.create(:user)}


  it { should belong_to :user }
  it { should have_one :drivers_license }
  it { should have_one :image }
  it { should have_many(:reservations).with_foreign_key("renter_account_id") }
  it { should have_many(:loans).with_foreign_key("lender_account_id") }
  it { should have_many(:owned_vehicles).with_foreign_key("owner_account_id").class_name("Vehicle") }
  it { should have_many(:reviews) }

  it "adds an account to newly created user" do
    expect(user.account.id).not_to be(nil)
  end

  it "validates the users age" do
     account = user.account
     account.update({user_birth_date: Faker::Date.between(10.years.ago, 1.years.ago)})
     account.save
     account.valid?
     expect(account.errors[:user_birth_date]).to include("You Must Be Over 18 Years Old To Use This Service")
  end

end
