class Item < ApplicationRecord
  mount_uploader :img, ImgUploader

  validates :name, presence: true
end
