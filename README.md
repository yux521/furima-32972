# テーブル設計

## Users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| email                   | string | null: false |
| encrypted_password      | string | null: false |
| nickname                | string | null: false |
| lastname                | string | null: false |
| firstname               | string | null: false |
| lastname_kana           | string | null: false |
| firstname_kana          | string | null: false |
| birthday                | date   | null: false |
### Association
has_many :items
has_many :buys

## Items テーブル

| Column           | Type        | Options          |
| ---------------- | ----------- | ---------------- |
| name             | string      | null: false      |
| explanation      | text        | null: false      |
| category_id      | integer     | null: false      |
| quality_id       | integer     | null: false      |
| price            | integer     | null: false      |
| shipping_id      | integer     | null: false      |
| area_id          | integer     | null: false      |
| shipping_day_id  | integer     | null: false      |
| user             | references  | foreign_key: true|

### Association
belongs_to :user
has_one :buy

## Buys テーブル

| Column    | Type        | Options              |
| --------- | ----------- | -------------------- |
| user      | references  | foreign_key: true    |
| items     | references  | foreign_key: true    |


### Association
has_one : address
belongs_to :item
belongs_to :user

## Addresss テーブル

| Column         | Type       | Options              |
| -------------- | ---------- | -------------------- |
| postal_code    | string     | null: false          |
| area_id        | integer    | null: false          |
| municipalities | string     | null: false          |
| number         | string     | null: false          |
| building       | string     |                      |
| tel            | string     | null: false          |
| buy            | references | foreign_key: true    |

### Association
belongs_to :buy