class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :shows, through: :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  def self.from_omniauth(auth)
	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  user.email = auth.info.email
	  user.password = Devise.friendly_token[0,20]
	  user.name = auth.info.name
	  user.image = auth.info.image
    end
  end
end
