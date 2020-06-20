require 'rails_helper'

RSpec.describe Comment, type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:item) { FactoryBot.create(:item) }
  let!(:comment) { FactoryBot.create(:comment, user: user, item: item, content: 'test_content') }

  describe "口コミ投稿機能" do

    # it "ログインしていると投稿できる" do 
    #   login(user)
    #   visit item_path(item)
    #   expect do
    #     fill_in 'title', with: 'テストタイトル'
    #      星を選択できない
    #     fill_in 'content', with: 'テストコンテント'
    #     click_on '口コミを投稿する'
    #   end.to change { Comment.count }.by(+1)
    #   expect(page).to have_content '口コミを投稿しました'
    # end

    it "ログインしてないと投稿できない" do
      visit item_path(item)
      expect(page).to have_content '口コミを投稿するにはログインしてください'
    end
  end

  describe "表示機能" do
    it "マイページに表示される" do 
      login(user)
      visit account_path
      expect(page).to have_content comment.title
    end

    it "アイテム詳細ページに表示される" do
      visit item_path(item)
      expect(page).to have_content comment.title
    end
  end

  describe "口コミ削除機能" do
    it "アイテム詳細ページから口コミを削除できる" do
      login(user)
      visit item_path(item)
      expect do
        click_link '口コミを削除する' 
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか?"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '口コミを削除しました' 
      end.to change { Comment.count }.by(-1)
    end

    it "ユーザー詳細ページから口コミを削除できる" do
      login(user)
      visit account_path
      expect do
        click_link '口コミを削除する' 
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか?"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '口コミを削除しました' 
      end.to change { Comment.count }.by(-1)
    end
  end

end