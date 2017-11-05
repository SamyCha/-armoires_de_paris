class Product < ApplicationRecord
  monetize :price_cents

  belongs_to :user
  has_many :reviews
  has_attachment :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true

  validates :category, presence: true
  validates :price, presence: true
  validates :sexe, presence: true
  validates :taille, presence: true
  validates :marque, presence: true
  validates :etat, presence: true
  validates :matiere, presence: true
  validates :couleur, presence: true

end
