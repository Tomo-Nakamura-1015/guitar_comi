class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
