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

## users テーブル

| Column          | Type   | Options     |
| --------------- | -------| ----------- |
| nickname        | string | null: false |
| mail            | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| shipping_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- has_one_attached

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one : shipping-address
- belongs_to :user
- belongs_to :item

## shipping-address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_cord     | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase