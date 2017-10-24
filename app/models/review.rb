class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :content, length: { minimum: 10 }
end
