class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "口コミを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "口コミを投稿できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:danger] = "口コミを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :title, :rate)
  end

end
