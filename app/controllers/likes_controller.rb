class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(item_id: params[:item_id])
    @like.save
    flash[:notice] = "#{@like.item.name}をお気に入り登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(item_id: params[:item_id]).destroy
    flash[:error] = "お気に入り登録を解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
