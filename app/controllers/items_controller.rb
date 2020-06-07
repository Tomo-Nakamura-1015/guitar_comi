class ItemsController < ApplicationController
  before_action :admin_user, only: [:edit, :new, :destroy]
  before_action :set_item, only: [:show, :create, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(1)
    # @items = @items.page(params[:page])
    @q = Item.ransack(params[:q])
    @result = @q.result(distinct: true)
    @result = @result.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      flash[:success] = "新規アイテムを登録しました"
      redirect_to @item
    else
      flash[:danger] = "新規アイテム登録できませんでした"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "アイテムを更新しました"
      redirect_to @item
    else
      flash[:danger] = "アイテム更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:danger] = "アイテムを削除しました"
    redirect_to items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :company, :image_url, :subject, :url)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
