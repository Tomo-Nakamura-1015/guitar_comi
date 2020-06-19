class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item

  validates :name, presence: true, length: { maximum: 30 }

  def remember_me
    true
  end

  def like(item)
    likes.find_or_create_by(item_id: item.id)
  end

  def unlike(item)
    like = likes.find_by(item_id: item.id)
    like.destroy if like
  end

end
