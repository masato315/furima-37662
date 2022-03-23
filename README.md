# README

## users テーブル

| Column             | Type   | options                 |
| -------------------| ------ | ----------------------- |
| name               | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| kana_fist_name     | string | null: false             |
| kana_last_name     | string | null: false             |
| birthday           | date   | null: false             |

### Association
- has_many :items 
- has_many :buys


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| goods_name    | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| home_id       | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : buy


## buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false  foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : partner


## partners

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false unique:true        |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to : buy

