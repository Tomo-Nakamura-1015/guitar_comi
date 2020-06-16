class HomeController < ApplicationController

  def home
    @item = Item.order(created_at: :desc).limit(8)
    @comment = Comment.order(created_at: :desc).limit(5)
  end

  def support
  end
end
