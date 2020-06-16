class Accounts::ImagesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    @user = current_user
    if @user.update(image_params)
      flash[:notice] = "画像を変更しました"
      redirect_to account_path
    else
      flash[:error] = "もう一度やりなおしてください"
      render :edit
    end
  end

  private

  def image_params
      params.permit(:image, :image_cache, :remove_image)
  end
end
