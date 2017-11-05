class Review < ApplicationRecord
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :content, length: { minimum: 5 }
end
