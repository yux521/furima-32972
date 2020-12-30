# テーブル設計

## Users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| lastname       | string | null: false |
| firstname      | string | null: false |
| lastname_kana  | string | null: false |
| firstname_kana | string | null: false |
| birthday       | date   | null: false |
### Association
has_many :items
has_many :buys

## Items テーブル

| Column         | Type   | Options          |
| -------------- | ------ | ---------------- |
| item          | string  | null: false      | 商品名
| image         | text    | null: false      | 出品画像
| explanation   | text    | null: false      | 商品説明
| category      | string  | null: false      | カテゴリー
| quality       | text    | null: false      | 商品の状態
| price         | integer | null: false      | 販売価格
| shipping      | integer | null: false      | 送料の負担
| area          | string  | null: false      | 発送元の地域
| Shipping_day  | integer | null: false      | 発送日数
| user_id       |         | foreign_key: true| 

### Association
belongs_to :user
has_one :buy

## Buys テーブル

| Column        | Type    | Options              |
| ------------- | ------- | -------------------- |
| pay           | integer | null: false          |
| user_id       |         | foreign_key: true    |
| items_id      |         | foreign_key: true    |
| address_id    |         | foreign_key: true    |


### Association
has_one : address
belongs_to :Item
belongs_to :user

## Addresss テーブル

| Column         | Type    | Options              |
| -------------- | ------- | -------------------- |
| postal_code    | integer | null: false          |郵便番号
| prefectures    | string  | null: false          |都道府県
| municipalities | string  | null: false          |市町村
| number         | integer | null: false          |番地
| building       | string  | null: false          |建物名
| tel            | integer | null: false          |電話番号

### Association
belongs_to :buys