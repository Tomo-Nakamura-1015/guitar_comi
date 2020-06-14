crumb :root do
  link "Home", root_path
end

crumb :items do
  link 'アイテム一覧検索', items_path
end

crumb :account do
  link 'マイページ', account_path
end

crumb :contact do
  link 'お問い合わせ', new_contacts_path
end

crumb :account_edit do
  link 'ユーザー編集', edit_account_path
  parent :account
end

crumb :account_edit_name do
  link '名前の変更', edit_account_name_path
  parent :account_edit
end

crumb :account_edit_image do
  link 'プロフィール画像の変更', edit_account_image_path
  parent :account_edit
end

crumb :account_edit_email do
  link 'メールアドレスの変更', edit_account_email_path
  parent :account_edit
end

crumb :account_edit_password do
  link 'パスワードの変更', edit_account_password_path
  parent :account_edit
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :items
end

crumb :comment_edit do
  link '口コミの編集', edit_item_comment_path
  parent :account
end

crumb :login do
  link 'ログイン', new_user_session_path
end

crumb :new_user do
  link '新規登録', new_user_registration_path
end

crumb :new_user_password do
  link 'パスワード再設定', new_user_password_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).