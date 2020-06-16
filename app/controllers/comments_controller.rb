class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:create, :edit, :update]

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "口コミを編集しました"
      redirect_to @item
    else
      flash[:error] = "口コミを編集できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @comment = @item.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "口コミを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "口コミを投稿できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:error] = "口コミを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :title, :rate)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
