class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  after_create  :send_welcome_email
  validates_presence_of :gamecenter_id, :on => :update
  attr_accessible :email, :encrypted_password, :name, :gamecenter_id

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first
      unless user
        user = User.create(:name => data["name"],
          :email => data["email"],
          :encrypted_password => Devise.friendly_token[0,20]
        )
      end
      user
  end
  
  private
  def send_welcome_email
    logger.info "Sending welcome email to #{self.email}"
    UserMailer.welcome_email(self).deliver
  end
end
