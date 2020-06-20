require 'rails_helper'

RSpec.describe Item, type: :system do
  let(:item) { FactoryBot.create(:item) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe "検索、表示機能" do
    it "アイテムの検索機能" do
      visit items_path
      fill_in 'キーワードで検索', with: item.name
      click_button '検索'
      expect(page).to have_content item.name
    end

    it "アイテムの詳細表示" do
      visit item_path(item)
      expect(page).to have_content item.name
      expect(page).to have_content 'の口コミ'
    end
  end

  describe "管理者" do
    before { login(admin_user) }
    
    it "管理者はアイテムの登録ができる" do
      visit new_item_path
      fill_in 'item_name', with: 'test_name'
      fill_in 'item_company', with: 'test_company'
      fill_in 'url', with: 'test_url'
      fill_in 'item_subject', with: 'test_subject'
      click_button '登録する'
      expect(page).to have_content '新規アイテムを登録しました'
    end

    it "管理者はアイテムの編集ができる" do
      visit edit_item_path(item)
      fill_in 'item_name', with: 'test_name2'
      fill_in 'item_company', with: 'test_company2'
      fill_in 'url', with: 'test_url2'
      fill_in 'item_subject', with: 'test_subject2'
      fill_in 'image_url', with: 'https://'
      click_button '登録する'
      expect(page).to have_content 'アイテムを更新しました'
      expect(page).to have_content 'test_name2'
    end

    it "管理者はアイテムの削除ができる" do
      visit item_path(item)
      expect do
        click_link '削除' 
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか?"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アイテムを削除しました' 
      end.to change { Item.count }.by(-1)
    end
  end

end