class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :save_account

  has_one :account, dependent: :destroy

  validates :email, :presence => true

  def save_account
    self.create_account!()
  end


end
