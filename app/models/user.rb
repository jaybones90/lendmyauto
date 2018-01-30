class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Call method to create a new account once a user is saved to the database
  after_create :save_account, :send_welcome_email_to_new_user

  # Assocations
  has_one :account, dependent: :destroy

  # Validations
  validates :email, :presence => true


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  #
  def self.from_omniauth(auth)
    new_or_found_user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
    found_account = new_or_found_user.account
    update_account_details(found_account, auth)
    new_or_found_user
  end

private

  # Create an account for each user after they sucessfully signup
  def save_account
    self.create_account()
  end

  def send_welcome_email_to_new_user
    SendEmailJob.set(wait: 20.seconds).perform_later(self)
  end

  def self.update_account_details(account, auth)
    account.skip_phone_validation = true
    account.skip_birthdate_validation = true
    account.user_first_name = auth.info.name.split( )[0] if account.user_first_name.nil?
    account.user_last_name = auth.info.name.split( )[1] if account.user_last_name.nil?
    account.remote_image = auth.info.image if auth.info.image?
    account.save
  end



end
