# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

- 基本機能
  - devise ユーザー登録
    - User
    - Campany (Userの子モデルとしてCampanyテーブルに同時登録)
    - ユーザー登録の際にカテゴリー選択できる様にseedファイル作成済み
  -投稿機能
  - いいね機能
    - UserがUserのproductionに対していいねできる
  - フォロー機能実装
    - UserがUserのproductionに対していいねできる
  - メッセージ機能
    - UserがUsernにDMを送れる。モデルはRoom、Entery(中間テーブル)、Message
