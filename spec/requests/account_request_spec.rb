# require "rails_helper"
#
# describe "Restricted access to accounts", type: :request do
#
#   it "redirects if an account does not have a drivers license" do
#     account_attributes = FactoryBot.attributes_for(:account)
#     user = FactoryBot.create(:user)
#     @account = user.account
#     patch accounts_path(@account) , params: { account: account_attributes }
#     expect(response).to redirect_to new_account_drivers_license_path(:account)
#   end
#
# end
