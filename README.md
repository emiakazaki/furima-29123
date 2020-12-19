# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birthday        | string | null: false |
| first name      | string | null: false |
| last name       | string | null: false |
| first name_kana | string | null: false |
| last name_kana  | string | null: false |

### Association
- has_many :items
- has_one :order

## items テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| image           | string | null: false |
| text            | string | null: false |
| price           | string | null: false |
| delivery free   | string | null: false |
| state           | string | null: false |
| category        | string | null: false |
| ship from       | string | null: false |
| delivery time   | string | null: false |
| user_id         | string | null: false |

### Association
- has_one :order
- belongs_to :user

## orders テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| user_id         | string | null: false |
| item_id         | string | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| postal code     | string | null: false |
| prefecture      | string | null: false |
| municipality    | string | null: false |
| address         | string | null: false |
| building name   | string | null: false |
| tel             | string | null: false |
| order_id        | string | null: false |

### Association
- belongs_to : order