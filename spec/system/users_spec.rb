require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe 'ログイン前' do
    it '新規ユーザー登録できる' do
      expect do
        visit root_path
        click_link '新規登録'
        fill_in '名前', with: 'Test'
        fill_in 'メールアドレス', with: 'test@test.com'
        fill_in 'パスワード（６文字以上）', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_on '登録する'
      end.to change { User.count }.by(+1)
      expect(page).to have_content 'アカウント登録が完了しました。'
    end

    it "ログインできる" do
      visit root_path
      click_link 'ログイン'
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_on 'ログインする'
      expect(page).to have_content 'ログインしました。'
    end

    it '登録済みでないユーザーはログインできない' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'password'
      click_on 'ログインする'
      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end
  end

  describe 'ログイン後' do
    before { login(user) }

    it "ログアウトできる" do
      visit account_path
      click_on '[ログアウト]'
      expect(page.driver.browser.switch_to.alert.text).to eq "本当にログアウトしますか?"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'ログアウトしました。'
    end

    it "退会できる" do
      visit edit_account_path
      expect do
        click_link '退会' 
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に退会しますか?"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。' 
      end.to change { User.count }.by(-1)
    end

    describe "プロフィール編集ができる" do

      it "名前の変更ができる" do
        visit edit_account_name_path(user)
        fill_in '名前', with: 'test2'
        click_on '名前を変更する'
        expect(page).to have_content '名前を変更しました'
      end

      it "メールアドレスの変更ができる" do
        visit edit_account_email_path(user)
        fill_in '変更後のメールアドレス', with: 'test2@test.com'
        fill_in '現在のパスワード', with: 'password'
        click_on 'メールアドレスを変更する'
        expect(page).to have_content 'メールアドレスを変更しました'
      end

      it "画像の変更ができる" do
        visit edit_account_image_path(user)
        attach_file 'image', 'spec/images/test_image.png'
        click_on '画像を変更する'
        expect(page).to have_content '画像を変更しました'
      end

      it "パスワードの変更ができる" do
        visit edit_account_password_path(user)
        fill_in '変更後のパスワード', with: 'password2'
        fill_in '変更後のパスワード(確認)', with: 'password2'
        fill_in '現在のパスワード', with: 'password'
        click_on 'パスワードを変更する'
        expect(page).to have_content 'パスワードを変更しました'
      end
    end
  end

  describe "管理者権限" do
    it "admin: trueなら管理者ページに入れる" do
      login(admin_user)
      visit root_path(admin_user)
      click_link '管理者ページ'
      # expect(page).to have_content 'ダッシュボード'
    end

    it "admin: falseだと管理者ページに入れない" do
      visit rails_admin_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end
end