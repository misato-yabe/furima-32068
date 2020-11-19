# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column    | Type       | Options                        |
| ------    | ------     | ------------------------------ |
| title     | string     | null: false                    |
| text      | text       | null: false                    |
| category  | date       | null: false                    |
| condition | date       | null: false                    |
| price     | integer    | null: false                    |
| postage   | date       | null: false                    |
| country   | date       | null: false                    |
| days      | date       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postcode   | string     | null: false                    |
| prefecture | date       | null: false                    |
| city       | string     | null: false                    |
| block      | string     | null: false                    |
| building   | string     |                                |
| tell       | string     | null: false                    |
| buy        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy