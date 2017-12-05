class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  after_create :save_account

  has_one :account, dependent: :destroy

  validates :email, :presence => true

  def save_account
    self.create_account()
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    new_or_found_user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
    account = new_or_found_user.account
    account.user_first_name = auth.info.name.split( )[0] if account.user_first_name.nil?
    account.user_last_name = auth.info.name.split( )[1] if account.user_last_name.nil?
    account.skip_phone_validation = true
    account.skip_birthdate_validation = true
    account.save!
    new_or_found_user
  end


end
