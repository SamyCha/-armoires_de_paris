class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :products, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :address, presence: true
  validates :first_name, presence: true
  validates :description, presence: true
  validates :role, presence: true
  #validates :avatar, file: {ext: [:jpg, :png]}


def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

#Pour renvoyer dans le panneau d'admin l'email, on peut remplacer par "#{first_name} #{first_name}"
  def name
   email
  end
#Pour définir le type d'utilisateur (client ou vendeur)
  enum role: [:client, :vendor]
  after_initialize :init

  def init
    self.role  ||= 0
  end
end
