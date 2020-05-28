class Accounts::PasswordsController < ApplicationController
  before_action :authenticate_user!
 
    def edit
    end
 
    def update
      if current_user.update_with_password(password_params)
        flash[:success] = "パスワードを変更しました"
        redirect_to account_path
      else
        flash[:danger] = "もう一度やりなおしてください"
        render :edit
      end
    end
 
    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation, :current_password)
    end

end
