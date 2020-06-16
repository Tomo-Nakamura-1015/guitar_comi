class ItemsController < ApplicationController
  before_action :admin_user, only: [:edit, :new, :destroy, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(1)
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
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "新規アイテムを登録しました"
      redirect_to root_path
    else
      flash[:error] = "新規アイテム登録できませんでした"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "アイテムを更新しました"
      redirect_to @item
    else
      flash[:error] = "アイテム更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:error] = "アイテムを削除しました"
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
