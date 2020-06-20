class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @comments = Comment.all.order(created_at: :desc).page(params[:page])
    @items = current_user.like_items.page(params[:page]).per(4)
  end

end
