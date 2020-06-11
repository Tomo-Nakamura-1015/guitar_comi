require 'rails_helper'

RSpec.describe Item, type: :system do
  let(:item) { FactoryBot.create(:item) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe "検索、表示機能" do
    it "アイテムの検索機能" do
    end

    it "アイテムの詳細表示" do
    end
  end

  describe "管理者" do
    before { login(admin_user) }
    it "管理者はアイテムの登録ができる" do
    end

    it "管理者はアイテムの編集ができる" do
    end

    it "管理者はアイテムの削除ができる" do
    end
  end

end