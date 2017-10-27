class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products, :dependent => :destroy
  has_many :reviews

#Pour renvoyer dans le panneau admin l'email, on peut remplacer par "#{first_name} #{first_name}"
  def name
   email
  end

end
