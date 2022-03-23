# README

## users テーブル

| Column         | Type   | options                 |
| ---------------| ------ | ----------------------- |
| name           | string | null: false             |
| email          | string | null: false unique:true |
| password       | string | null: false             |
| first_name     | string | null: false             |
| last_name      | string | null: false             |
| kana_fist_name | string | null: false             |
| kana_last_name | string | null: false             |
| birthday       | date   | null: false             |

### Association
- has_many :items 
- has_many :buys


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| goods_name    | text       | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery      | string     | null: false                    |
| home          | string     | null: false                    |
| day           | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : buys


## buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false  foreign_key: true |
| items    | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : partner


## partners

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false unique:true        |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to : buy

