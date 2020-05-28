class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @comments = Comment.all
  end

end
