# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| product_name    | string  | null: false |
| text            | text    | null: false |
| price           | integer | null: false |
| fee_id          | integer | null: false |
| state_id        | integer | null: false |
| category_id     | integer | null: false |
| prefecture_id   | integer | null: false |
| time_id         | integer | null: false |
| user_id         | integer | null: false, foreign_key: true|

### Association
- has_one :order
- belongs_to :user

## orders テーブル

| Column          | Type    | Options                       |
| --------------- | ------- | ----------------------------- |
| user_id         | integer | null: false, foreign_key: true|
| item_id         | integer | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | string  | null: false |
| prefecture_id   | integer | null: false |
| municipality    | string  | null: false |
| address         | string  | null: false |
| building_name   | string  |             |
| tel             | string  | null: false |
| order_id        | integer | null: false, foreign_key: true|

### Association
- belongs_to : order