# テーブル設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

## itemsテーブル
| Column              | Type      | Options     |
| ------------------- | ----------| ----------- |
| product_name        | string    | null: false |
| product_description | text      | null: false |
| product_category_id | integer   | null: false |
| product_status_id   | integer   | null: false |
| shipping_fee_id     | integer   | null: false |
| shipping_area_id    | integer   | null: false |
| delivery_time_id    | integer   | null: false |
| product_price       | integer   | null: false |
| user                | references| null: false, foreign_key: true|

## purchase_recordsテーブル
| Column             | Type      | Options     |
| ------------------ | ----------| ----------- |
| user               | references| null: false, foreign_key: true|
| item               | references| null: false, foreign_key: true|

## ordersテーブル
| Column              | Type      | Options     |
| ------------------- | ----------| ----------- |
| post_code           | string    | null: false |
| prefecture_id       | integer   | null: false |
| city                | string    | null: false |
| block               | string    | null: false |
| building            | string    |
| phone_number        | string    | null: false |
| purchase_record     | references| null: false, foreign_key: true|

