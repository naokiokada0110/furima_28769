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

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| nickname     | string   | null: false |
| mail-address | string   | null: false |
| password     | string   | null: false |
| name-kanji   | string   | null: false |
| name-kana    | string   | null: false |
| birthday     | datetime | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product-image       | string     | null: false                    |
| product-name        | string     | null: false                    |
| product-description | text       | null: false                    |
| category            | string     | null: false                    |
| product-status      | string     | null: false                    |
| delivery-charge     | string     | null: false                    |
| shipping-area       | string     | null: false                    |
| shipping-day        | string     | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

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

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| address  | string    | null: false                    |
| purchase | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase