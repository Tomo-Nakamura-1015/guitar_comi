class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :name, presence: true
  validates :subject, presence: true, length: {maximum:400}

end
