class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, dependent: :destroy


  validates :first_name, :last_name, :email, :age, :phone_number, :presence => true


  after_create :save_account

  private

  def save_account
    account = Account.create!(:user_id => self.id)
    self.account_id = account.id
  end

end
