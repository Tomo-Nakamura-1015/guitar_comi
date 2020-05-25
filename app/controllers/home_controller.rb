class HomeController < ApplicationController

  def home
    @item = Item.order(created_at: :desc).limit(10)
    @comment = Comment.order(created_at: :desc).limit(10)
  end
end
