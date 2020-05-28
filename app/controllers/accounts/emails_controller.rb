class Accounts::EmailsController < ApplicationController
  before_action :authenticate_user!
 
    def edit
    end
 
    def update
      if current_user.update_with_password(email_params)
        flash[:success] = "メールアドレスを変更しました"
        redirect_to account_path
      else
        flash[:danger] = "もう一度やりなおしてください"
        render :edit
      end
    end
 
    private

    def email_params
        params.require(:user).permit(:email, :current_password)
    end
end
