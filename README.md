# ギタコミ
ギタコミは、Ruby on railsで作成した、口コミ共有サービスです。
現在はポートフォリオとして公開しています。

新しい機能の追加、細かい箇所を詰めをし、AmazonAPIやアフィリエイトリンクで収益化も狙いたい（予定）

## サイトURL
https://aqueous-cliffs-88077.herokuapp.com/

#### テストアカウント
* メールアドレス：test@test.com
* パスワード：testtest

## 使用技術
* インフラ(Heroku)
* 単体・統合テスト(RSpec, factory_bot, capybara)
* データベース(PostgreSQL)
* ユーザーログイン認証機能(Devise)
* 管理者機能(cancancan,rails_admin)
* 画像アップロード(carrierwave, mini_magick)
* ページネイト(kaminari)
* お問い合わせメール送信(ActionMailer)
* 検索機能(ransack)
* パンくずリスト(gretel)
* デザイン(Bootstrap)

## 環境
* 言語(Ruby 2.7.0)
* フレームワーク(Rails 6.0.2)
* 開発(ローカル)