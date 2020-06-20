require 'rails_helper'

RSpec.describe "お気に入り登録機能", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  before { login(user) }

  describe "お気に入り登録する前" do
    it "お気に入り登録できる" do
      visit item_path(item)
      expect do
        click_on 'お気に入り登録'
      end .to change { Like.count }.by(+1)
      expect(page).to have_content 'をお気に入り登録しました。'
    end
  end

  describe "お気に入り登録した後" do
    before do
      visit item_path(item)
      click_on 'お気に入り登録'
    end

    it "お気に入り解除できる" do
      expect do
        click_on 'お気に入り登録中'
      end .to change { Like.count }.by(-1)
      expect(page).to have_content 'お気に入り登録を解除しました。'
    end

    it "マイページにお気に入りが表示されている" do
      visit account_path(user)
      expect(page).to have_content item.name
    end
  end
end