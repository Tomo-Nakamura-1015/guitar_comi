class Item < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :subject, presence: true, length: {maximum:400}
end
