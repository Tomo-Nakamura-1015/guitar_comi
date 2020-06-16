class Accounts::NamesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    @user = current_user
    if @user.update(name_params)
      flash[:notice] = "名前を変更しました"
      redirect_to account_path
    else
      flash[:error] = "もう一度やりなおしてください"
      render :edit
    end
  end

  private

  def name_params
    params.permit(:name)
  end

end
