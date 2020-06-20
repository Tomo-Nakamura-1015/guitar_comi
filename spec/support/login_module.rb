module LoginModule
  def login(user)
    visit root_path
    click_on 'ログイン', match: :first
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    click_on 'ログインする'
  end
end