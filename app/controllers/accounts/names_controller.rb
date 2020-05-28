class Accounts::NamesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    @name = current_user.name
    if @name.update(name_params)
      flash[:success] = "名前を変更しました"
      redirect_to account_path
    else
      flash[:danger] = "もう一度やりなおしてください"
      render :edit
    end
  end

  private

  def name_params
    params.require(:user).permit(:name)
  end

end
