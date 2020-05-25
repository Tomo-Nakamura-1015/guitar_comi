class Item < ApplicationRecord
  mount_uploader :img, ImgUploader

  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
