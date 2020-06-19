class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(item_id: params[:item_id])
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(item_id: params[:item_id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
